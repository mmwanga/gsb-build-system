/* GtkUnique - Single Instance Application library
 * gtkuniqueapp-dbus.c: D-Bus implementation of GtkUniqueApp
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
#include <gdk/gdk.h>
#include <errno.h>

#include <dbus/dbus-protocol.h>
#include <dbus/dbus-glib.h>
#include <dbus/dbus-glib-bindings.h>

#include "../gtkuniqueinternals.h"
#include "gtkuniquefactory-dbus.h"
#include "gtkuniqueapp-glue.h"
#include "gtkuniqueapp-dbus.h"

struct _GtkUniqueAppDBus
{
  GtkUniqueAppObject parent_instance;

  DBusGProxy *proxy;

  GSList *windows;
};

struct _GtkUniqueAppDBusClass
{
  GtkUniqueAppObjectClass parent_class;
};

G_DEFINE_TYPE (GtkUniqueAppDBus,
               _gtk_unique_app_dbus,
               GTK_TYPE_UNIQUE_APP_OBJECT);

static gboolean
_gtk_unique_app_dbus_register_proxy (GtkUniqueAppDBus *app)
{
  DBusGConnection *connection;
  GError *error;
  gchar *name;

  error = NULL;
  connection = dbus_g_bus_get (DBUS_BUS_SESSION, &error);
  if (!connection)
    {
      g_warning ("Unable to open a connection to the session bus: %s",
                 error->message);
      g_error_free (error);

      return FALSE;
    }

  name = ((GtkUniqueAppObject *) app)->name;
  app->proxy = dbus_g_proxy_new_for_name (connection, name,
                                          "/Factory",
                                          "org.gtk.UniqueApp");
  
  return TRUE;
}

static gboolean
_gtk_unique_app_dbus_register_factory (GtkUniqueAppDBus *app)
{
  const gchar *name;
  DBusGConnection *connection;
  DBusGProxy *proxy;
  GError *error;
  guint32 request_name;
  gboolean res, retval;

  error = NULL;
  connection = dbus_g_bus_get (DBUS_BUS_SESSION, &error);
  if (!connection)
    return FALSE;

  retval = TRUE;
  name = gtk_unique_app_object_get_name (GTK_UNIQUE_APP_OBJECT (app));
  g_assert (name != NULL);

  proxy = dbus_g_proxy_new_for_name (connection,
                                     DBUS_SERVICE_DBUS,
                                     DBUS_PATH_DBUS,
                                     DBUS_INTERFACE_DBUS);

  res = org_freedesktop_DBus_request_name (proxy, name,
                                           0,
                                           &request_name,
                                           &error);
  if (!res)
    retval = FALSE;

  if (request_name != DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER)
    retval = FALSE;

  if (retval == TRUE)
    {
      GtkUniqueFactoryDBus *factory;

      factory = g_object_new (GTK_TYPE_UNIQUE_FACTORY_DBUS, NULL);
      dbus_g_connection_register_g_object (connection, "/Factory",
                                           G_OBJECT (factory));

      factory->parent = GTK_UNIQUE_APP_OBJECT (app)->parent;
    }

  g_object_unref (proxy);

  return retval;
}

static void
_gtk_unique_app_dbus_send_message (GtkUniqueAppObject *app,
                                   GtkUniqueCommand    command,
                                   const gchar        *data,
                                   GtkUniqueResponse  *response)
{
  GtkUniqueAppDBus *app_dbus;
  const gchar *startup_id;
  gchar *cmd, *resp;
  guint screen, workspace;
  gboolean res;
  GError *error;

  app_dbus = GTK_UNIQUE_APP_DBUS (app);

  _gtk_unique_app_dbus_register_proxy (app_dbus);
  if (!app_dbus->proxy)
    {
      g_warning ("No D-Bus proxy object found, aborting...");
      return;
    }
  
  startup_id = gtk_unique_app_object_get_startup_id (app);
  screen = gdk_screen_get_number (gtk_unique_app_object_get_screen (app));
  workspace = gtk_unique_app_object_get_workspace (app);
  cmd = _gtk_unique_command_to_string (command);

  error = NULL;
  resp = NULL;
  res = org_gtk_UniqueApp_send_message (app_dbus->proxy,
                                        cmd, data,
                                        startup_id, screen, workspace,
                                        &resp,
                                        &error);
  if (error)
    {
      g_warning ("Error while sending message: %s",
                 error->message);
      g_error_free (error);
      g_free (cmd);
      
      return;
    }

  if (response)
    *response = _gtk_unique_response_from_string (resp);

  g_free (cmd);
  g_free (resp);
}

static gboolean
_gtk_unique_app_dbus_is_running (GtkUniqueAppObject *app)
{
  GtkUniqueAppDBus *app_dbus = GTK_UNIQUE_APP_DBUS (app);

  return _gtk_unique_app_dbus_register_factory (app_dbus) != TRUE;
}

static void
_gtk_unique_app_dbus_add_window (GtkUniqueAppObject *app,
                                 GtkWindow          *window)
{
  GtkUniqueAppDBus *app_dbus;

  app_dbus = GTK_UNIQUE_APP_DBUS (app);

  if (g_slist_find (app_dbus->windows, window))
    {
      g_warning ("This window has already been added");
      return;
    }

  app_dbus->windows = g_slist_prepend (app_dbus->windows, window);

  _gtk_unique_app_dbus_register_factory (app_dbus);
}

static void
_gtk_unique_app_dbus_remove_window (GtkUniqueAppObject *app,
                                    GtkWindow          *window)
{
  GtkUniqueAppDBus *app_dbus;

  app_dbus = GTK_UNIQUE_APP_DBUS (app);

  if (!g_slist_find (app_dbus->windows, window))
    {
      g_warning ("This window was not added");
      return;
    }

  app_dbus->windows = g_slist_remove (app_dbus->windows, window);
}

static GSList *
_gtk_unique_app_dbus_list_windows (GtkUniqueAppObject *app)
{
  GtkUniqueAppDBus *app_dbus;
  GSList *retval, *l;

  app_dbus = GTK_UNIQUE_APP_DBUS (app);

  for (retval = NULL, l = app_dbus->windows; l != NULL; l = l->next)
    retval = g_slist_prepend (retval, l->data);

  return g_slist_reverse (retval);
}

static void
_gtk_unique_app_dbus_finalize (GObject *gobject)
{
  GtkUniqueAppDBus *app = GTK_UNIQUE_APP_DBUS (gobject);

  if (app->proxy)
    g_object_unref (app->proxy);

  g_slist_free (app->windows);

  G_OBJECT_CLASS (_gtk_unique_app_dbus_parent_class)->finalize (gobject);
}

static void
_gtk_unique_app_dbus_class_init (GtkUniqueAppDBusClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
  GtkUniqueAppObjectClass *uniqueapp_class;
  
  uniqueapp_class = GTK_UNIQUE_APP_OBJECT_CLASS (klass);

  gobject_class->finalize = _gtk_unique_app_dbus_finalize;

  uniqueapp_class->is_running = _gtk_unique_app_dbus_is_running;
  uniqueapp_class->send_message = _gtk_unique_app_dbus_send_message;
  uniqueapp_class->add_window = _gtk_unique_app_dbus_add_window;
  uniqueapp_class->remove_window = _gtk_unique_app_dbus_remove_window;
  uniqueapp_class->list_windows = _gtk_unique_app_dbus_list_windows;
}

static void
_gtk_unique_app_dbus_init (GtkUniqueAppDBus *app)
{

}

GType
_gtk_unique_app_impl_get_type (void)
{
  return _gtk_unique_app_dbus_get_type ();
}
