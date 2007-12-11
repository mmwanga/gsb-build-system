/* GtkUnique - Single Instance Application library
 * gtkuniqueapp.h: Base object for single instance applications
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

#ifndef __GTK_UNIQUE_APP_H__
#define __GTK_UNIQUE_APP_H__

#include <glib-object.h>
#include <gtk/gtkwindow.h>

G_BEGIN_DECLS

#define GTK_TYPE_UNIQUE_APP             (gtk_unique_app_get_type ())
#define GTK_UNIQUE_APP(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_UNIQUE_APP, GtkUniqueApp))
#define GTK_IS_UNIQUE_APP(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_UNIQUE_APP))
#define GTK_UNIQUE_APP_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_UNIQUE_APP, GtkUniqueAppClass))
#define GTK_IS_UNIQUE_APP_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_UNIQUE_APP))
#define GTK_UNIQUE_APP_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_UNIQUE_APP, GtkUniqueAppClass))

typedef enum { /*< prefix=GTK_UNIQUE >*/
  GTK_UNIQUE_ACTIVATE,
  GTK_UNIQUE_NEW,
  GTK_UNIQUE_OPEN,
  GTK_UNIQUE_CUSTOM,

  GTK_UNIQUE_INVALID
} GtkUniqueCommand;

typedef enum { /*< prefix=GTK_UNIQUE_RESPONSE >*/
  GTK_UNIQUE_RESPONSE_OK,
  GTK_UNIQUE_RESPONSE_CANCEL,
  GTK_UNIQUE_RESPONSE_ABORT,
  GTK_UNIQUE_RESPONSE_FAIL,

  GTK_UNIQUE_RESPONSE_INVALID
} GtkUniqueResponse;

typedef struct _GtkUniqueApp            GtkUniqueApp;
typedef struct _GtkUniqueAppPrivate     GtkUniqueAppPrivate;
typedef struct _GtkUniqueAppClass       GtkUniqueAppClass;

struct _GtkUniqueApp
{
  /*< private >*/
  GObject parent_instance;

  GtkUniqueAppPrivate *priv;
};

struct _GtkUniqueAppClass
{
  GObjectClass parent_class;

  /* signals */
  GtkUniqueResponse (*message) (GtkUniqueApp     *app,
                                GtkUniqueCommand  command,
                                const gchar      *command_data,
                                const gchar      *startup_id,
                                GdkScreen        *screen,
                                guint             workspace);

  /* padding for future expansion */
  void (*_gtk_unique1) (void);
  void (*_gtk_unique2) (void);
  void (*_gtk_unique3) (void);
  void (*_gtk_unique4) (void);
};

GType gtk_unique_app_get_type (void) G_GNUC_CONST;

GtkUniqueApp *    gtk_unique_app_new           (const gchar      *name);
GtkUniqueApp *    gtk_unique_app_new_with_id   (const gchar      *name,
                                                const gchar      *startup_id);
gboolean          gtk_unique_app_is_running    (GtkUniqueApp     *app);
void              gtk_unique_app_add_window    (GtkUniqueApp     *app,
                                                GtkWindow        *window);
void              gtk_unique_app_remove_window (GtkUniqueApp     *app,
                                                GtkWindow        *window);
GSList *          gtk_unique_app_list_windows  (GtkUniqueApp     *app);
GtkUniqueResponse gtk_unique_app_send_message  (GtkUniqueApp     *app,
                                                GtkUniqueCommand  command,
                                                const gchar      *data);

/* convenience functions around gtk_unique_app_send_message() */
GtkUniqueResponse gtk_unique_app_activate      (GtkUniqueApp     *app);
GtkUniqueResponse gtk_unique_app_new_document  (GtkUniqueApp     *app);
GtkUniqueResponse gtk_unique_app_open_uri      (GtkUniqueApp     *app,
                                                const gchar      *uri);

G_END_DECLS

#endif /* __GTK_UNIQUE_APP_H__ */
