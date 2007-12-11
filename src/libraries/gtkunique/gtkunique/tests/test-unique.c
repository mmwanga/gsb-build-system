/* GtkUnique - Single Instance Application library
 *
 * Copyright (C) 2006  Emmanuele Bassi  <ebassi@o-hand.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * This progra, is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 */

#include <stdlib.h>
#include <gtk/gtk.h>
#include <gtkunique/gtkunique.h>

static GtkWidget *main_window = NULL;

static GtkUniqueResponse
app_message_cb (GtkUniqueApp     *app,
                GtkUniqueCommand  command,
                const gchar      *data,
                const gchar      *startup_id,
                GdkScreen        *screen,
                guint             workspace)
{
  GEnumClass *enum_class;
  GEnumValue *enum_value;
  GtkWidget *dialog;
  gchar *title, *message;

  enum_class = g_type_class_ref (GTK_TYPE_UNIQUE_COMMAND);
  enum_value = g_enum_get_value (enum_class, command);
  g_print ("Command received:\n"
           "  command (id): %s (%d)\n"
           "  data........: %s\n"
           "  startup id..: %s\n"
           "  screen......: %d\n"
           "  workspace...: %d\n",
           enum_value->value_nick, command,
           data ? data : "<null>",
           startup_id ? startup_id : "<null>",
           gdk_screen_get_number (screen),
           workspace);

  title = g_strdup_printf ("Received the '%s' Command",
                           enum_value->value_nick);
  
  switch (command)
    {
    case GTK_UNIQUE_NEW:
      message = g_strdup ("This command should open a new window");
      break;
    case GTK_UNIQUE_OPEN:
      message = g_strdup_printf ("This command should open a new\n"
                                 "window for the URI `%s'",
                                 data);
      break;
    case GTK_UNIQUE_ACTIVATE:
      message = g_strdup ("This command should activate the current window");
      gtk_window_present (GTK_WINDOW (main_window));
      break;
    case GTK_UNIQUE_CUSTOM:
      message = g_strdup_printf ("This command contains custom data: `%s'",
                                 data);
      gtk_window_present (GTK_WINDOW (main_window));
      g_print ("Data: `%s'\n", data);
      break;
    default:
      message = NULL;
      break;
    }

  dialog = gtk_message_dialog_new (GTK_WINDOW (main_window),
                                   GTK_DIALOG_DESTROY_WITH_PARENT,
                                   GTK_MESSAGE_INFO,
                                   GTK_BUTTONS_CLOSE,
                                   title);
  if (message)
    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),
                                              message);

  gtk_window_set_screen (GTK_WINDOW (dialog), screen);
  gtk_dialog_run (GTK_DIALOG (dialog));

  gtk_widget_destroy (dialog);

  g_free (message);
  g_free (title);
  g_type_class_unref (enum_class);

  return GTK_UNIQUE_RESPONSE_OK;
}

int
main (int argc, char *argv[])
{
  const gchar *startup_id;
  GtkUniqueApp *app;
  gboolean new = FALSE;
  gboolean activate = FALSE;
  gchar *open_uri = NULL;
  GError *init_error = NULL;
  GOptionEntry entries[] = {
    { "new", 'n',
      0,
      G_OPTION_ARG_NONE, &new,
      "Send 'new' command", NULL,
    },
    { "open-uri", 'o',
      0,
      G_OPTION_ARG_STRING, &open_uri,
      "Send 'open-uri' command", "uri",
    },
    {
      "activate", 'a',
      0,
      G_OPTION_ARG_NONE, &activate,
      "Send 'activate' command", NULL,
    },
    { NULL },
  };

  startup_id = g_getenv ("DESKTOP_STARTUP_ID");

  gtk_init_with_args (&argc, &argv,
                      "Test GtkUnique",
                      entries,
                      NULL,
                      &init_error);
  if (init_error)
    {
      g_print ("*** Error: %s\n"
               "Usage: test-unique [COMMAND]\n",
               init_error->message);
      g_error_free (init_error);

      exit (1);
    }
  
  app = gtk_unique_app_new_with_id ("org.gnome.TestGtkUnique",
                                    startup_id);
  if (gtk_unique_app_is_running (app))
    {
      GtkUniqueResponse response;

      if (new)
        response = gtk_unique_app_new_document (app);
      else if (open_uri)
        response = gtk_unique_app_open_uri (app, open_uri);
      else if (activate)
        response = gtk_unique_app_activate (app);
      else
        response = gtk_unique_app_send_message (app,
                                                GTK_UNIQUE_CUSTOM,
                                                "Custom data");
      gdk_notify_startup_complete ();

      g_print ("Response code: %d\n", response);
      
      g_object_unref (app);

      exit ((response == GTK_UNIQUE_RESPONSE_OK));
    }
  else
    {
      main_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      g_signal_connect (main_window, "destroy", G_CALLBACK (gtk_main_quit), NULL);
      gtk_window_set_title (GTK_WINDOW (main_window), "Test GtkUnique");
      gtk_window_set_default_size (GTK_WINDOW (main_window), 400, 300);
      gtk_container_set_border_width (GTK_CONTAINER (main_window), 12);

      gtk_unique_app_add_window (app, GTK_WINDOW (main_window));
      g_signal_connect (app, "message", G_CALLBACK (app_message_cb), NULL);

      gtk_widget_show (main_window);
    }
  
  gtk_main ();

  g_object_unref (app);

  return EXIT_SUCCESS;
}
