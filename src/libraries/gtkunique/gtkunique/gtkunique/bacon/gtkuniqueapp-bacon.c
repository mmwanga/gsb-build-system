/* GtkUnique - Single Instance Application library
 * gtkuniqueapp-bacon.h: Unix socket implementation of GtkUniqueApp
 *
 * Copyright (C) 2006  Emmanuele Bassi  <ebassi@o-hand.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#include <sys/socket.h>
#include <sys/un.h>
#include <errno.h>
#include <glib/gstdio.h>

#include "../gtkuniqueinternals.h"
#include "gtkuniquefactory-bacon.h"
#include "gtkuniqueapp-bacon.h"

#ifndef UNIX_PATH_MAX
#define UNIX_PATH_MAX 108
#endif

struct _GtkUniqueAppBacon
{
  GtkUniqueAppObject parent_instance;

  gchar *socket_path;
  gint socket_fd;
  
  GIOChannel *channel;
  guint source_id;

  GSList *connections;

  guint is_server : 1;

  GSList *windows;
};

struct _GtkUniqueAppBaconClass
{
  GtkUniqueAppObjectClass parent_class;
};

G_DEFINE_TYPE (GtkUniqueAppBacon,
               _gtk_unique_app_bacon,
               GTK_TYPE_UNIQUE_APP_OBJECT);


static gboolean
is_socket (const gchar *path)
{
  struct stat stat_buf;

  if (g_stat (path, &stat_buf) == -1)
    return FALSE;

  return (S_ISSOCK (stat_buf.st_mode));
}

static gboolean
is_socket_owned_by_user (const gchar *path)
{
  struct stat stat_buf;

  if (g_stat (path, &stat_buf) == -1)
    return FALSE;

  return (S_ISSOCK (stat_buf.st_mode) && stat_buf.st_uid == geteuid ());
}

/* free the return value */
static gchar *
find_file_with_pattern (const gchar *path,
                        const gchar *pattern)
{
  GDir *dir;
  gchar *retval;
  const gchar *file;
  GPatternSpec *pat;

  dir = g_dir_open (path, 0, NULL);
  if (!dir)
    return NULL;

  pat = g_pattern_spec_new (pattern);
  if (!pat)
    {
      g_dir_close (dir);
      return NULL;
    }

  retval = NULL;
  while ((file = g_dir_read_name (dir)) != NULL)
    {
      if (g_pattern_match_string (pat, file))
        {
          gchar *temp = g_build_filename (path, file, NULL);

          if (is_socket_owned_by_user (temp))
            {
              retval = temp;
              break;
            }
          
          g_free (temp);
        }
    }

  g_pattern_spec_free (pat);
  g_dir_close (dir);

  return retval;
}

/* free the returned value */
static gchar *
find_socket_file (const gchar *name)
{
  gchar *basename, *path;
  gchar *tmpdir;
  
  /* socket file name template:
   *   /tmp/gtk-unique/org.gnome.YourApplication.hostname.process-id
   */

  basename = g_strconcat (name, ".", g_get_host_name (), ".*", NULL);
  tmpdir = g_build_path (G_DIR_SEPARATOR_S,
                         g_get_tmp_dir (),
                         "gtk-unique",
                         NULL);

  if (g_mkdir (tmpdir, 0777) == -1)
    {
      if (errno != EEXIST)
        {
          g_warning ("Unable to create socket path `%s': %s",
                     tmpdir,
                     g_strerror (errno));
          return NULL;
        }
    }

  path = find_file_with_pattern (tmpdir, basename);
  if (path)
    {
      g_free (tmpdir);
      g_free (basename);

      return path;
    }

  g_free (basename);

  basename = g_strdup_printf ("%s.%s.%d",
                              name,
                              g_get_host_name (),
                              getpid ());
  path = g_build_filename (tmpdir,
                           basename,
                           NULL);

  g_free (tmpdir);
  g_free (basename);

  return path;
}

static gboolean
server_socket_cb (GIOChannel   *source,
                  GIOCondition  condition,
                  gpointer      data)
{
  GtkUniqueAppBacon *app = data;

  if (!app)
    return FALSE;

  if (!app->channel)
    return FALSE;

  if (condition & G_IO_IN)
    {
      GtkUniqueFactoryBacon *factory;
      gboolean res;

      factory = g_object_new (GTK_TYPE_UNIQUE_FACTORY_BACON, NULL);
      factory->parent = GTK_UNIQUE_APP_OBJECT (app)->parent;

      res = _gtk_unique_factory_bacon_accept (factory, app->socket_fd);

      if (res)
        app->connections = g_slist_prepend (app->connections, factory);
      else
        {
          g_warning ("Could not accept the connection");
          g_object_unref (factory);
        }
    }
  else if (condition & G_IO_HUP)
    {
      g_debug (G_STRLOC ": factory hung up");
    }
  else if (condition & G_IO_ERR)
    {
      g_warning ("Server error");
    }

  return TRUE;
}

static gboolean
setup_connection (GtkUniqueAppBacon *app,
                  gboolean           is_server)
{
  g_assert (app->socket_fd != -1);
  g_assert (app->channel == NULL);

  if (is_server)
    {
      app->channel = g_io_channel_unix_new (app->socket_fd);
      g_io_channel_set_line_term (app->channel, "\r\n", 2);
      
      app->source_id = g_io_add_watch (app->channel,
                                       G_IO_IN | G_IO_ERR | G_IO_HUP,
                                       server_socket_cb,
                                       app);
      return (app->source_id > 0);
    }

  return TRUE;
}

static gboolean
try_client (GtkUniqueAppBacon *app)
{
  struct sockaddr_un uaddr;
  size_t path_len;
  int res;

  g_assert (app->socket_path != NULL);

  path_len = MIN (strlen (app->socket_path) + 1, UNIX_PATH_MAX);

  uaddr.sun_family = AF_UNIX;
  strncpy (uaddr.sun_path, app->socket_path, path_len);
  
  app->socket_fd = socket (PF_UNIX, SOCK_STREAM, 0);
  res = connect (app->socket_fd, (struct sockaddr *) &uaddr, sizeof (uaddr));
  if (res == -1)
    {
      app->socket_fd = -1;
      return FALSE;
    }

  return setup_connection (app, FALSE);
}

#define MAX_CONNECTIONS 5

static void
create_server (GtkUniqueAppBacon *app)
{
  struct sockaddr_un uaddr;
  size_t path_len;
  int res;

  g_assert (app->socket_path != NULL);

  path_len = MIN (strlen (app->socket_path) + 1, UNIX_PATH_MAX);

  uaddr.sun_family = AF_UNIX;
  strncpy (uaddr.sun_path, app->socket_path, path_len);

  app->socket_fd = socket (PF_UNIX, SOCK_STREAM, 0);
  res = bind (app->socket_fd, (struct sockaddr *) &uaddr, sizeof (uaddr));
  if (res == -1)
    {
      app->socket_fd = -1;
      return;
    }
  
  listen (app->socket_fd, MAX_CONNECTIONS);

  setup_connection (app, TRUE);
}

static void
_gtk_unique_app_bacon_close_connection (GtkUniqueAppBacon *app)
{
  if (app->source_id)
    {
      g_source_remove (app->source_id);
      app->source_id = 0;
    }

  if (app->channel)
    {
      g_io_channel_shutdown (app->channel, FALSE, NULL);
      g_io_channel_unref (app->channel);
      app->channel = NULL;
    }

  if (app->socket_fd != -1)
    close (app->socket_fd);

  if (g_unlink (app->socket_path) == -1)
    {
      if (errno != ENOENT)
        {
          g_warning ("Unable to remove old socket file: %s",
                     g_strerror (errno));
        }
    }

  g_slist_foreach (app->connections, (GFunc) g_object_unref, NULL);
  g_slist_free (app->connections);
}

static void
_gtk_unique_app_bacon_open_connection (GtkUniqueAppBacon *app,
                                       const gchar       *name)
{
  g_assert (app->socket_path == NULL);

  app->socket_path = find_socket_file (name);
  
  if (!is_socket (app->socket_path))
    {
      create_server (app);
      app->is_server = TRUE;

      return;
    }

  if (!try_client (app))
    {
      if (g_unlink (app->socket_path) == -1)
        {
          g_warning ("Unable to unlink stale socket `%s': %s",
                     app->socket_path,
                     g_strerror (errno));
          return;
        }

      create_server (app);
      app->is_server = TRUE;

      return;
    }

  app->is_server = FALSE;
}

static void
_gtk_unique_app_bacon_finalize (GObject *gobject)
{
  GtkUniqueAppBacon *app = GTK_UNIQUE_APP_BACON (gobject);
  GSList *l;

  if (app->is_server || app->connections)
    _gtk_unique_app_bacon_close_connection (app);

  for (l = app->windows; l != NULL; l = l->next)
    gtk_unique_app_remove_window (GTK_UNIQUE_APP (app), l->data);

  g_slist_free (app->windows);

  G_OBJECT_CLASS (_gtk_unique_app_bacon_parent_class)->finalize (gobject);
}

static gboolean
_gtk_unique_app_bacon_is_running (GtkUniqueAppObject *app)
{
  GtkUniqueAppBacon *app_bacon;
  const gchar *name;

  app_bacon = GTK_UNIQUE_APP_BACON (app);
  name = gtk_unique_app_object_get_name (app);

  _gtk_unique_app_bacon_open_connection (app_bacon, name);

  return (app_bacon->is_server == FALSE);
}

static gchar *
pack_message_string (const gchar *command,
                     const gchar *data,
                     const gchar *startup_id,
                     const guint  screen,
                     const guint  workspace,
                     gsize       *length)
{
  gchar *retval;
  gchar *command_e, *data_e, *startup_id_e, *screen_e, *workspace_e;

  command_e = g_strescape (command, NULL);
  
  if (data && data[0] != '\0')
    data_e = g_strescape (data, NULL);
  else
    data_e = g_strdup ("none");

  if (startup_id && startup_id[0] !='\0')
    startup_id_e = g_strescape (startup_id, NULL);
  else
    startup_id_e = g_strdup ("none");

  screen_e = g_strdup_printf ("%d", screen);
  workspace_e = g_strdup_printf ("%d", workspace);

  retval = g_strjoin ("\v", command_e,
                            data_e,
                            startup_id_e,
                            screen_e,
                            workspace_e,
                            "\r\n",
                            NULL);

  if (length)
    *length = strlen (retval);

  g_free (command_e);
  g_free (data_e);
  g_free (startup_id_e);
  g_free (workspace_e);

  return retval;
}

static void
_gtk_unique_app_bacon_send_message (GtkUniqueAppObject *app,
                                    GtkUniqueCommand    command,
                                    const gchar        *data,
                                    GtkUniqueResponse  *response)
{
  GtkUniqueAppBacon *app_bacon;
  const gchar *startup_id, *name;
  guint screen, workspace;
  gchar *cmd, *message;
  gsize message_len;
  GString *resp_buffer;
  gsize res, term;
  gchar buf;

  app_bacon = GTK_UNIQUE_APP_BACON (app);

  name = gtk_unique_app_object_get_name (app);
  startup_id = gtk_unique_app_object_get_startup_id (app);
  screen = gdk_screen_get_number (gtk_unique_app_object_get_screen (app));
  workspace = gtk_unique_app_object_get_workspace (app);

  cmd = _gtk_unique_command_to_string (command);
  message = pack_message_string (cmd, data,
                                 startup_id, screen, workspace,
                                 &message_len);
  
  if (write (app_bacon->socket_fd, message, message_len) == -1)
    {
      g_warning ("Unable to send message: %s",
                 g_strerror (errno));

      g_free (cmd);
      g_free (message);

      if (response)
        *response = GTK_UNIQUE_RESPONSE_FAIL;

      return;
    }
  else
    {
      fsync (app_bacon->socket_fd);
    }

  g_free (cmd);
  g_free (message);

  resp_buffer = g_string_new (NULL);
  buf = term = res = 0;

  res = read (app_bacon->socket_fd, &buf, 1);
  while (res > 0 && buf != '\n')
    {
      resp_buffer = g_string_append_c (resp_buffer, buf);
      term += res;

      res = read (app_bacon->socket_fd, &buf, 1);
      if (res < 0)
        {
          g_warning ("Unable to receive the response: %s",
                     g_strerror (errno));

          close (app_bacon->socket_fd);
          app_bacon->socket_fd = -1;

          if (response)
            *response = GTK_UNIQUE_RESPONSE_FAIL;

          g_string_free (resp_buffer, TRUE);

          return;
        }
    }

  message = g_string_free (resp_buffer, FALSE);
  message[term - 1] = '\0';

  if (response)
    *response = _gtk_unique_response_from_string (message);

  g_free (message);
}

static void
_gtk_unique_app_bacon_add_window (GtkUniqueAppObject *app,
                                  GtkWindow          *window)
{
  GtkUniqueAppBacon *app_bacon;

  app_bacon = GTK_UNIQUE_APP_BACON (app);

  if (g_slist_find (app_bacon->windows, window))
    {
      g_warning ("This window has already been added");
      return;
    }

  app_bacon->windows = g_slist_prepend (app_bacon->windows, window);
}

static void
_gtk_unique_app_bacon_remove_window (GtkUniqueAppObject *app,
                                     GtkWindow          *window)
{
  GtkUniqueAppBacon *app_bacon;

  app_bacon = GTK_UNIQUE_APP_BACON (app);

  if (!g_slist_find (app_bacon->windows, window))
    {
      g_warning ("This window was not added");
      return;
    }

  app_bacon->windows = g_slist_remove (app_bacon->windows, window);
}

static GSList *
_gtk_unique_app_bacon_list_windows (GtkUniqueAppObject *app)
{
  GtkUniqueAppBacon *app_bacon;
  GSList *retval, *l;

  app_bacon = GTK_UNIQUE_APP_BACON (app);

  retval = NULL;
  for (l = app_bacon->windows; l != NULL; l = l->next)
    retval = g_slist_prepend (retval, l->data);

  return g_slist_reverse (retval);
}

static void
_gtk_unique_app_bacon_class_init (GtkUniqueAppBaconClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
  GtkUniqueAppObjectClass *uniqueapp_class;
  
  uniqueapp_class = GTK_UNIQUE_APP_OBJECT_CLASS (klass);

  gobject_class->finalize = _gtk_unique_app_bacon_finalize;

  uniqueapp_class->is_running = _gtk_unique_app_bacon_is_running;
  uniqueapp_class->send_message = _gtk_unique_app_bacon_send_message;
  uniqueapp_class->add_window = _gtk_unique_app_bacon_add_window;
  uniqueapp_class->remove_window = _gtk_unique_app_bacon_remove_window;
  uniqueapp_class->list_windows = _gtk_unique_app_bacon_list_windows;
}

static void
_gtk_unique_app_bacon_init (GtkUniqueAppBacon *app)
{
  app->is_server = FALSE;

  app->socket_fd = -1;
  app->socket_path = NULL;
  
  app->windows = NULL;
}

GType
_gtk_unique_app_impl_get_type (void)
{
  return _gtk_unique_app_bacon_get_type ();
}
