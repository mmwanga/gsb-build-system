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

#ifndef __GTK_UNIQUE_APP_OBJECT_H__
#define __GTK_UNIQUE_APP_OBJECT_H__

#include <glib-object.h>
#include <gdk/gdkscreen.h>
#include <gtkunique/gtkuniqueapp.h>

G_BEGIN_DECLS

#define GTK_TYPE_UNIQUE_APP_OBJECT              (gtk_unique_app_object_get_type ())
#define GTK_UNIQUE_APP_OBJECT(obj)              (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_UNIQUE_APP_OBJECT, GtkUniqueAppObject))
#define GTK_IS_UNIQUE_APP_OBJECT(obj)           (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_UNIQUE_APP_OBJECT))
#define GTK_UNIQUE_APP_OBJECT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_UNIQUE_APP_OBJECT, GtkUniqueAppObjectClass))
#define GTK_IS_UNIQUE_APP_OBJECT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_UNIQUE_APP_OBJECT))
#define GTK_UNIQUE_APP_OBJECT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_UNIQUE_APP_OBJECT, GtkUniqueAppObjectClass))

typedef struct _GtkUniqueAppObject      GtkUniqueAppObject;
typedef struct _GtkUniqueAppObjectClass GtkUniqueAppObjectClass;

struct _GtkUniqueAppObject
{
  GObject parent_instance;

  GtkUniqueApp *parent;

  gchar *name;
  gchar *startup_id;

  guint workspace;

  GdkScreen *screen;
};

struct _GtkUniqueAppObjectClass
{
  GObjectClass parent_class;

  /* vfuncs for the implementations */
  gboolean (*is_running)    (GtkUniqueAppObject *app);
  void     (*send_message)  (GtkUniqueAppObject *app,
                             GtkUniqueCommand    command,
                             const gchar        *command_data,
                             GtkUniqueResponse  *response);
  void     (*add_window)    (GtkUniqueAppObject *app,
                             GtkWindow          *window);
  void     (*remove_window) (GtkUniqueAppObject *app,
                             GtkWindow          *window);
  GSList * (*list_windows)  (GtkUniqueAppObject *app);

  /* padding, for future expansion */
  void (*_gtk_unique_1) (void);
  void (*_gtk_unique_2) (void);
  void (*_gtk_unique_3) (void);
  void (*_gtk_unique_4) (void);
  void (*_gtk_unique_5) (void);
};

GType gtk_unique_app_object_get_type (void) G_GNUC_CONST;

G_CONST_RETURN gchar *gtk_unique_app_object_get_name       (GtkUniqueAppObject *app);
void                  gtk_unique_app_object_set_name       (GtkUniqueAppObject *app,
                                                            const gchar        *name);
G_CONST_RETURN gchar *gtk_unique_app_object_get_startup_id (GtkUniqueAppObject *app);
void                  gtk_unique_app_object_set_startup_id (GtkUniqueAppObject *app,
                                                            const gchar        *startup_id);
guint                 gtk_unique_app_object_get_workspace  (GtkUniqueAppObject *app);
void                  gtk_unique_app_object_set_workspace  (GtkUniqueAppObject *app,
                                                            guint               workspace);
GdkScreen *           gtk_unique_app_object_get_screen     (GtkUniqueAppObject *app);
void                  gtk_unique_app_object_set_screen     (GtkUniqueAppObject *app,
                                                            GdkScreen          *screen);

G_END_DECLS

#endif /* __GTK_UNIQUE_APP_OBJECT_H__ */
