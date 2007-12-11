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

#include <stdio.h>
#include <stdlib.h>

#include <glib-object.h>
#include <gtk/gtk.h>
#include <gtkunique/gtkunique.h>

typedef struct _TestApplication         TestApplication;
typedef struct _TestApplicationClass    TestApplicationClass;

#define TEST_TYPE_APPLICATION           (test_application_get_type ())
#define TEST_APPLICATION(obj)           (G_TYPE_CHECK_INSTANCE_CAST ((obj), TEST_TYPE_APPLICATION, TestApplication))
#define TEST_IS_APPLICATION(obj)        (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TEST_TYPE_APPLICATION))

struct _TestApplication
{
  GtkUniqueApp parent_instance;

  GtkWidget *main_window;
};

struct _TestApplicationClass
{
  GtkUniqueAppClass parent_class;
};

G_DEFINE_TYPE (TestApplication, test_application, GTK_TYPE_UNIQUE_APP);

static GtkUniqueResponse
test_application_message (GtkUniqueApp     *app,
                          GtkUniqueCommand  command,
                          const gchar      *command_data,
                          const gchar      *startup_id,
                          GdkScreen        *screen,
                          guint             workspace)
{
  TestApplication *test_app = TEST_APPLICATION (app);
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
           command_data ? command_data : "<null>",
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
                                 command_data);
      break;
    case GTK_UNIQUE_ACTIVATE:
      message = g_strdup ("This command should activate the current window");
      gtk_window_present (GTK_WINDOW (test_app->main_window));
      break;
    case GTK_UNIQUE_CUSTOM:
      message = g_strdup_printf ("This command contains custom data: `%s'",
                                 command_data);
      gtk_window_present (GTK_WINDOW (test_app->main_window));
      g_print ("Data: `%s'\n", command_data);
      break;
    default:
      message = NULL;
      break;
    }

  dialog = gtk_message_dialog_new (GTK_WINDOW (test_app->main_window),
                                   GTK_DIALOG_DESTROY_WITH_PARENT,
                                   GTK_MESSAGE_INFO,
                                   GTK_BUTTONS_CLOSE,
                                   title);
  if (message)
    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),
                                              message);
  gtk_dialog_run (GTK_DIALOG (dialog));

  gtk_widget_destroy (dialog);

  g_free (message);
  g_free (title);
  g_type_class_unref (enum_class);

  return GTK_UNIQUE_RESPONSE_OK;
}

static void
test_application_finalize (GObject *gobject)
{
  TestApplication *app = TEST_APPLICATION (gobject);

  if (app->main_window)
    gtk_widget_destroy (app->main_window);

  G_OBJECT_CLASS (test_application_parent_class)->finalize (gobject);
}

static void
test_application_class_init (TestApplicationClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
  GtkUniqueAppClass *unique_class = GTK_UNIQUE_APP_CLASS (klass);

  gobject_class->finalize = test_application_finalize;

  unique_class->message = test_application_message;
}

static void
test_application_init (TestApplication *app)
{

}

GtkUniqueApp *
test_application_new (const gchar *startup_id)
{
  return g_object_new (TEST_TYPE_APPLICATION,
                       "name", "org.gnome.TestApplication",
                       "startup-id", startup_id,
                       NULL);
}

void
test_application_quit (TestApplication *app)
{
  g_return_if_fail (TEST_IS_APPLICATION (app));

  app->main_window = NULL;

  gtk_main_quit ();  
}

void
test_application_run (TestApplication *app)
{
  g_return_if_fail (TEST_IS_APPLICATION (app));

  if (app->main_window)
    {
      gtk_window_present (GTK_WINDOW (app->main_window));
      return;
    }

  app->main_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  g_signal_connect_swapped (app->main_window, "destroy",
                            G_CALLBACK (test_application_quit),
                            app);

  gtk_window_set_title (GTK_WINDOW (app->main_window), "Test Application");
  gtk_window_set_default_size (GTK_WINDOW (app->main_window), 400, 300);

  gtk_widget_show (app->main_window);

  gtk_main ();
}

/*
 * main
 */

static GtkUniqueResponse
on_message_cb (GtkUniqueApp     *app,
               GtkUniqueCommand  command,
               const gchar      *command_data,
               const gchar      *startup_id,
               GdkScreen        *screen,
               guint             workspace,
               gpointer          user_data)
{
  g_debug (G_STRLOC ": received command %d\n", command);

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
 
  app = test_application_new (startup_id);
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
      g_signal_connect (app, "message",
                        G_CALLBACK (on_message_cb),
                        NULL);

      test_application_run (TEST_APPLICATION (app));
    }

  g_object_unref (app);

  return EXIT_SUCCESS;
}
