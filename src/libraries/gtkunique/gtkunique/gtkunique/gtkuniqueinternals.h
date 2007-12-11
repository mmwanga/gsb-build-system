#ifndef __GTK_UNIQUE_INTERNALS_H__
#define __GTK_UNIQUE_INTERNALS_H__

#include <gtkunique/gtkuniqueapp.h>
#include <gtkunique/gtkuniqueappobject.h>
#include <gtkunique/gtkuniqueenumtypes.h>
#include <gdk/gdkscreen.h>

GType _gtk_unique_app_impl_get_type (void) G_GNUC_CONST;

GtkUniqueCommand  _gtk_unique_command_from_string  (const gchar       *command);
gchar *           _gtk_unique_command_to_string    (GtkUniqueCommand   command) G_GNUC_MALLOC;
GtkUniqueResponse _gtk_unique_response_from_string (const gchar       *response);
gchar *           _gtk_unique_response_to_string   (GtkUniqueResponse  response) G_GNUC_MALLOC;

GtkUniqueResponse _gtk_unique_app_emit_message     (GtkUniqueApp     *app,
                                                    GtkUniqueCommand  command,
                                                    const gchar      *data,
                                                    const gchar      *startup_id,
                                                    GdkScreen        *screen,
                                                    guint             workspace);

#endif /* __GTK_UNIQUE_INTERNALS_H__ */
