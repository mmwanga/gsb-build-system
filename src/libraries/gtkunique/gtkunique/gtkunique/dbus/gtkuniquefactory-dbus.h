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

#ifndef __GTK_UNIQUE_FACTORY_DBUS_H__
#define __GTK_UNIQUE_FACTORY_DBUS_H__

#include <glib-object.h>
#include <gtkunique/gtkuniqueapp.h>

G_BEGIN_DECLS

#define GTK_TYPE_UNIQUE_FACTORY_DBUS            (_gtk_unique_factory_dbus_get_type ())
#define GTK_UNIQUE_FACTORY_DBUS(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_UNIQUE_FACTORY_DBUS, GtkUniqueFactoryDBus))
#define GTK_IS_UNIQUE_FACTORY_DBUS(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_UNIQUE_FACTORY_DBUS))
#define GTK_UNIQUE_FACTORY_DBUS_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_UNIQUE_FACTORY_DBUS, GtkUniqueFactoryDBusClass))
#define GTK_IS_UNIQUE_FACTORY_DBUS_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_UNIQUE_FACTORY_DBUS))
#define GTK_UNIQUE_FACTORY_DBUS_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_UNIQUE_FACTORY_DBUS, GtkUniqueFactoryDBusClass))

typedef struct _GtkUniqueFactoryDBus            GtkUniqueFactoryDBus;
typedef struct _GtkUniqueFactoryDBusClass       GtkUniqueFactoryDBusClass;

struct _GtkUniqueFactoryDBus
{
  GObject parent_class;

  GtkUniqueApp *parent;
};

struct _GtkUniqueFactoryDBusClass
{
  GObjectClass parent_class;
};

GType _gtk_unique_factory_dbus_get_type (void) G_GNUC_CONST;

G_END_DECLS

#endif /* __GTK_UNIQUE_FACTORY_DBUS_H__ */
