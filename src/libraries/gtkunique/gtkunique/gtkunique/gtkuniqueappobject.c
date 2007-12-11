/* GtkUnique - Single Instance Application library
 * gtkuniqueappobject.h: Base object for backend implementations
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
 *
 * Design based on libguniqueapp
 *   Copyright (C) 2006  Vytautas Liuolia
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <gdk/gdk.h>
#include <gdk/gdkx.h>
#include <X11/Xatom.h>
#include <time.h>

#include <glib/gi18n.h>

#include "gtkuniqueappobject.h"
#include "gtkuniqueinternals.h"
#include "gtkuniqueenumtypes.h"

/*
 * GtkUniqueAppObject
 */

G_DEFINE_TYPE (GtkUniqueAppObject,
               gtk_unique_app_object,
               G_TYPE_OBJECT);

/* taken from gedit */
static guint
get_current_workspace (GdkScreen *screen)
{
  GdkWindow *root_win;
  GdkDisplay *display;
  Atom _net_current_desktop, type;
  int format;
  unsigned long n_items, bytes_after;
  unsigned char *data_return = 0;
  guint ret = 0;

  g_assert (GDK_IS_SCREEN (screen));

  root_win = gdk_screen_get_root_window (screen);
  display = gdk_screen_get_display (screen);
  _net_current_desktop =
    gdk_x11_get_xatom_by_name_for_display (display, "_NET_CURRENT_DESKTOP");

  XGetWindowProperty (GDK_DISPLAY_XDISPLAY (display),
                      GDK_WINDOW_XID (root_win),
		      _net_current_desktop,
		      0, G_MAXLONG,
                      False, XA_CARDINAL,
                      &type, &format, &n_items, &bytes_after,
                      &data_return);

  if (type == XA_CARDINAL && format == 32 && n_items > 0)
    {
      ret = (guint) data_return[0];
      XFree (data_return);
    }

  return ret;
}

static void
gtk_unique_app_object_finalize (GObject *gobject)
{
  GtkUniqueAppObject *object = GTK_UNIQUE_APP_OBJECT (gobject);

  g_free (object->name);
  g_free (object->startup_id);
  object->workspace = 0;
  object->screen = NULL;

  G_OBJECT_CLASS (gtk_unique_app_object_parent_class)->finalize (gobject);
}

static void
gtk_unique_app_object_class_init (GtkUniqueAppObjectClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);

  gobject_class->finalize = gtk_unique_app_object_finalize;
}

static void
gtk_unique_app_object_init (GtkUniqueAppObject *object)
{
  object->name = NULL;
  object->startup_id = NULL;
  object->screen = gdk_screen_get_default ();
  object->workspace = get_current_workspace (object->screen);
}

void
gtk_unique_app_object_set_name (GtkUniqueAppObject *app,
                                const gchar        *name)
{
  g_return_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app));
  g_return_if_fail (name != NULL);

  if (app->name != NULL && strcmp (app->name, name) != 0)
    {
      g_free (app->name);
      app->name = g_strdup (name);
    }
  else if (app->name == NULL)
    app->name = g_strdup (name);
}

void
gtk_unique_app_object_set_startup_id (GtkUniqueAppObject *app,
                                      const gchar        *startup_id)
{
  g_return_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app));
  
  if (app->startup_id != NULL && strcmp (app->startup_id, startup_id) != 0)
    {
      g_free (app->startup_id);
      app->startup_id = g_strdup (startup_id);
    }
  else
    app->startup_id = g_strdup (startup_id);
}

void
gtk_unique_app_object_set_workspace (GtkUniqueAppObject *app,
                                     guint               workspace)
{
  g_return_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app));

  if (app->workspace != workspace)
    {
      app->workspace = workspace;
    }
}

void
gtk_unique_app_object_set_screen (GtkUniqueAppObject *app,
                                  GdkScreen          *screen)
{
  g_return_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app));

  if (!screen)
    screen = gdk_screen_get_default ();

  if (app->screen != screen)
    {
      app->screen = screen;
      app->workspace = get_current_workspace (app->screen);
    }
}

G_CONST_RETURN gchar *
gtk_unique_app_object_get_startup_id (GtkUniqueAppObject *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app), NULL);
  
  return app->startup_id;
}

G_CONST_RETURN gchar *
gtk_unique_app_object_get_name (GtkUniqueAppObject *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app), NULL);

  return app->name;
}

guint
gtk_unique_app_object_get_workspace (GtkUniqueAppObject *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app), 0);
  
  return app->workspace;
}

GdkScreen *
gtk_unique_app_object_get_screen (GtkUniqueAppObject *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP_OBJECT (app), NULL);

  return app->screen;
}
