/* GtkUnique - Single Instance Application library
 * gtkuniquefactory-bacon.h: Unix socket factory for GtkUniqueApp
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

#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#include <sys/socket.h>
#include <sys/un.h>
#include <errno.h>
#include <glib/gstdio.h>
#include <gdk/gdk.h>
#include <gtk/gtk.h>
#include <errno.h>

#include "../gtkuniqueinternals.h"
#include "gtkuniquefactory-bacon.h"

G_DEFINE_TYPE (GtkUniqueFactoryBacon,
               _gtk_unique_factory_bacon,
               G_TYPE_OBJECT);


static void
_gtk_unique_factory_bacon_finalize (GObject *gobject)
{
  GtkUniqueFactoryBacon *factory = GTK_UNIQUE_FACTORY_BACON (gobject);

  if (factory->source_id)
    g_source_remove (factory->source_id);

  if (factory->channel)
    {
      g_io_channel_shutdown (factory->channel, TRUE, NULL);
      g_io_channel_unref (factory->channel);
    }

  if (factory->socket_fd != -1)
    close (factory->socket_fd);
   
  G_OBJECT_CLASS (_gtk_unique_factory_bacon_parent_class)->finalize (gobject);
}

static void
_gtk_unique_factory_bacon_class_init (GtkUniqueFactoryBaconClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);

  gobject_class->finalize = _gtk_unique_factory_bacon_finalize;
}

static void
_gtk_unique_factory_bacon_init (GtkUniqueFactoryBacon *factory)
{
  factory->parent = NULL;

  factory->socket_fd = -1;
  
  factory->channel = NULL;
  factory->source_id = 0;
}

static gboolean
_gtk_unique_factory_bacon_send_message (GtkUniqueFactoryBacon  *factory,
                                        const gchar            *command,
                                        const gchar            *data,
                                        const gchar            *startup_id,
                                        guint                   screen_number,
                                        guint                   workspace,
                                        gchar                 **response)
{
  GtkUniqueResponse resp_id;
  GtkUniqueCommand cmd_id;
  GdkDisplay *display;
  GdkScreen *screen;
  
  g_return_val_if_fail (GTK_IS_UNIQUE_FACTORY_BACON (factory), FALSE);
  g_return_val_if_fail (GTK_IS_UNIQUE_APP (factory->parent), FALSE);
  g_return_val_if_fail (command != NULL, FALSE);

  cmd_id = _gtk_unique_command_from_string (command);

  display = gdk_display_get_default ();
  screen = gdk_display_get_screen (display, screen_number);

  resp_id = _gtk_unique_app_emit_message (factory->parent,
                                          cmd_id, data,
                                          startup_id,
                                          screen,
                                          workspace);

  if (response)
    *response = _gtk_unique_response_to_string (resp_id);

  return TRUE;
}

static gboolean
unpack_message_string (const gchar  *message,
                       gchar       **command,
                       gchar       **data,
                       gchar       **startup_id,
                       guint        *screen,
                       guint        *workspace)
{
  gchar **blocks;
  gboolean retval = FALSE;

  blocks = g_strsplit (message, "\v", 5);
  if (blocks && g_strv_length (blocks) == 5)
    {
      if (command)
        *command = g_strcompress (blocks[0]);

      if (data)
        {
          gchar *tmp = g_strcompress (blocks[1]);

          if (strcmp (tmp, "none") == 0)
            *data = NULL;
          else
            *data = tmp;
        }

      if (startup_id)
        {
          gchar *tmp = g_strcompress (blocks[2]);

          if (strcmp (tmp, "none") == 0)
            *startup_id = NULL;
          else
            *startup_id = tmp;
        }

      if (screen)
        *screen = strtoul (blocks[3], NULL, 10);

      if (workspace)
        *workspace = strtoul (blocks[4], NULL, 10);

      retval = TRUE;
    }
  else
    {
      g_warning ("Invalid message format received");

      retval = FALSE;
    }
  
  if (blocks)
    g_strfreev (blocks);

  return retval;
}

static gchar *
parse_command_and_emit_message (GtkUniqueFactoryBacon *factory,
                                const gchar           *message)
{
  gchar *command, *data, *startup_id;
  guint screen, workspace;
  gboolean res;
  gchar *resp;

  res = unpack_message_string (message,
                               &command, &data,
                               &startup_id,
                               &screen,
                               &workspace);
  if (!res)
    return _gtk_unique_response_to_string (GTK_UNIQUE_RESPONSE_FAIL);

  res = _gtk_unique_factory_bacon_send_message (factory,
                                                command, data,
                                                startup_id,
                                                screen,
                                                workspace,
                                                &resp);
  if (!res)
    resp = _gtk_unique_response_to_string (GTK_UNIQUE_RESPONSE_FAIL);

  g_free (command);
  g_free (data);
  g_free (startup_id);

  return resp;
}

static gchar *
format_response_for_send (const gchar *response)
{
  return g_strconcat (response, "\r\n", NULL);
}

static gboolean
connection_cb (GIOChannel   *channel,
               GIOCondition  condition,
               gpointer      data)
{
  GtkUniqueFactoryBacon *factory = data;
  gchar *response;
  GError *read_error, *write_error;
  GIOStatus res;
  gchar *message;
  gsize len, term;

  if (!factory->channel)
    {
      g_warning ("No channel available");
      return FALSE;
    }

  if (condition & G_IO_ERR)
    {
      g_warning ("Connection to the sender failed");
      goto finished;
    }

  read_error = NULL;
  res = g_io_channel_read_line (factory->channel,
                                &message, &len,
                                &term,
                                &read_error);
  if (res == G_IO_STATUS_ERROR)
    {
      g_warning ("Unable to receive the command: %s",
                 read_error->message);
      g_error_free (read_error);
      goto finished;
    }

  if (len == 0)
    {
      g_warning ("Received a zero-len message");
      goto finished;
    }

  /* truncate the message at the line terminator */
  message[term] = '\0';
  response = parse_command_and_emit_message (factory, message);

  g_free (message);
  message = format_response_for_send (response);

  write_error = NULL;
  res = g_io_channel_write_chars (factory->channel,
                                  message, -1,
                                  NULL,
                                  &write_error);
  if (res == G_IO_STATUS_ERROR)
    {
      g_warning ("Unable to send response: %s",
                 write_error->message);
      g_error_free (write_error);
    }
  else
    {
      g_io_channel_flush (factory->channel, NULL);
    }

  g_free (response);
  g_free (message);

finished:
  factory->source_id = 0;

  return FALSE;
}

static void
cleanup_connection (gpointer data)
{

}

gboolean
_gtk_unique_factory_bacon_accept (GtkUniqueFactoryBacon *factory,
                                  gint                   socket_fd)
{
  unsigned int len;

  g_return_val_if_fail (GTK_IS_UNIQUE_FACTORY_BACON (factory), FALSE);
  g_return_val_if_fail (socket_fd != -1, FALSE);

  factory->socket_fd = accept (socket_fd, NULL, &len);

  factory->channel = g_io_channel_unix_new (factory->socket_fd);
  g_io_channel_set_line_term (factory->channel, "\r\n", 2);

  factory->source_id = g_io_add_watch_full (factory->channel,
                                            G_PRIORITY_DEFAULT,
                                            G_IO_IN | G_IO_ERR,
                                            connection_cb,
                                            factory,
                                            cleanup_connection);
  
  return TRUE;
}

gint
_gtk_unique_factory_bacon_get_fd (GtkUniqueFactoryBacon *factory)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_FACTORY_BACON (factory), -1);

  return factory->socket_fd;
}
