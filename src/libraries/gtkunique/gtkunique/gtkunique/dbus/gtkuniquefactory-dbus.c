/* GtkUnique - Single Instance Application library
 * gtkuniquefactory-dbus.h: D-Bus factory
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
#include <gtk/gtk.h>
#include <errno.h>

#include <dbus/dbus-protocol.h>
#include <dbus/dbus-glib.h>
#include <dbus/dbus-glib-bindings.h>

#include "../gtkuniqueinternals.h"
#include "gtkuniquefactory-dbus.h"

G_DEFINE_TYPE (GtkUniqueFactoryDBus,
               _gtk_unique_factory_dbus,
               G_TYPE_OBJECT);

#define gtkuniqueapp_send_message       _gtk_unique_factory_dbus_send_message

static gboolean
_gtk_unique_factory_dbus_send_message (GtkUniqueFactoryDBus  *factory,
                                       const gchar           *command_IN,
                                       const gchar           *data_IN,
                                       const gchar           *startup_id_IN,
                                       guint                  screen_IN,
                                       guint                  workspace_IN,
                                       gchar                **response_OUT,
                                       GError               **error)
{
  GtkUniqueCommand command;
  GtkUniqueResponse response;
  GtkUniqueApp *app;
  GdkDisplay *display;
  GdkScreen *screen;

  command = _gtk_unique_command_from_string (command_IN);
  if (command == GTK_UNIQUE_INVALID)
    {
      g_warning ("Invalid command `%s' received",
                 command_IN);
      return TRUE;
    }

  display = gdk_display_get_default ();
  screen = gdk_display_get_screen (display, screen_IN);

  app = factory->parent;
  response = _gtk_unique_app_emit_message (app,
                                           command, data_IN,
                                           startup_id_IN,
                                           screen,
                                           workspace_IN);

  *response_OUT = _gtk_unique_response_to_string (response);

  return TRUE;
}

#include "gtkuniqueapp-glue.h"
#include "gtkuniqueapp-bindings.h"

static void
_gtk_unique_factory_dbus_class_init (GtkUniqueFactoryDBusClass *klass)
{
  dbus_g_object_type_install_info (G_TYPE_FROM_CLASS (klass),
                                   &dbus_glib_gtkuniqueapp_object_info);
}

static void
_gtk_unique_factory_dbus_init (GtkUniqueFactoryDBus *factory)
{

}
