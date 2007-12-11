/* GtkUnique - Single Instance Applications library
 * gtkuniqueapp.c: Base single instance class
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
 * Based on libguniqueapp
 *      Copyright (C) 2006  Vytautas Liuolia
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

#include "gtkuniqueapp.h"
#include "gtkuniqueappobject.h"
#include "gtkuniqueinternals.h"
#include "gtkuniqueenumtypes.h"
#include "gtkuniquemarshal.h"

#define IS_VALID_COMMAND(cmd)   ((cmd) >= GTK_UNIQUE_ACTIVATE && \
                                 (cmd) < GTK_UNIQUE_INVALID)

#define IS_VALID_RESPONSE(res)  ((res) >= GTK_UNIQUE_RESPONSE_OK && \
                                 (res) < GTK_UNIQUE_RESPONSE_FAIL)
/*
 * GtkUniqueApp
 */

struct _GtkUniqueAppPrivate
{
  GtkUniqueAppObject *impl;
};

enum
{
  PROP_0,

  PROP_NAME,
  PROP_STARTUP_ID,
  PROP_WORKSPACE,
  PROP_SCREEN
};

enum
{
  MESSAGE,

  LAST_SIGNAL
};

static guint unique_app_signals[LAST_SIGNAL] = { 0, };

G_DEFINE_TYPE (GtkUniqueApp, gtk_unique_app, G_TYPE_OBJECT);

static gboolean
message_accumulator (GSignalInvocationHint *ihint,
                     GValue                *return_acc,
                     const GValue          *handler_return,
                     gpointer               dummy)
{
  gboolean continue_emission;
  GtkUniqueResponse response;

  response = g_value_get_enum (handler_return);
  continue_emission = (response == GTK_UNIQUE_RESPONSE_OK);

  return continue_emission;
}

static void
gtk_unique_app_finalize (GObject *gobject)
{
  G_OBJECT_CLASS (gtk_unique_app_parent_class)->finalize (gobject);
}

static void
gtk_unique_app_set_property (GObject      *gobject,
                             guint         prop_id,
                             const GValue *value,
                             GParamSpec   *pspec)
{
  GtkUniqueApp *app = GTK_UNIQUE_APP (gobject);
  GtkUniqueAppObject *impl = app->priv->impl;

  switch (prop_id)
    {
    case PROP_NAME:
      gtk_unique_app_object_set_name (impl, g_value_get_string (value));
      break;
    case PROP_STARTUP_ID:
      gtk_unique_app_object_set_startup_id (impl, g_value_get_string (value));
      break;
    case PROP_WORKSPACE:
      gtk_unique_app_object_set_workspace (impl, g_value_get_uint (value));
      break;
    case PROP_SCREEN:
      gtk_unique_app_object_set_screen (impl, g_value_get_object (value));
      break;
    default:
      G_OBJECT_WARN_INVALID_PROPERTY_ID (gobject, prop_id, pspec);
      break;
    }
}

static void
gtk_unique_app_get_property (GObject    *gobject,
                             guint       prop_id,
                             GValue     *value,
                             GParamSpec *pspec)
{
  GtkUniqueApp *app = GTK_UNIQUE_APP (gobject);
  GtkUniqueAppObject *impl = app->priv->impl;

  switch (prop_id)
    {
    case PROP_NAME:
      g_value_set_string (value, gtk_unique_app_object_get_name (impl));
      break;
    case PROP_STARTUP_ID:
      g_value_set_string (value, gtk_unique_app_object_get_startup_id (impl));
      break;
    case PROP_WORKSPACE:
      g_value_set_uint (value, gtk_unique_app_object_get_workspace (impl));
      break;
    case PROP_SCREEN:
      g_value_set_object (value, gtk_unique_app_object_get_screen (impl));
      break;
    default:
      G_OBJECT_WARN_INVALID_PROPERTY_ID (gobject, prop_id, pspec);
      break;
    }
}

static void
gtk_unique_app_class_init (GtkUniqueAppClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);

  gobject_class->set_property = gtk_unique_app_set_property;
  gobject_class->get_property = gtk_unique_app_get_property;
  gobject_class->finalize = gtk_unique_app_finalize;
  
  /**
   * GtkUniqueApp:name:
   *
   * The unique name of the #GtkUniqueApp object.
   **/
  g_object_class_install_property (gobject_class,
                                   PROP_NAME,
                                   g_param_spec_string ("name",
                                                        "Name",
                                                        "The name of the application",
                                                        NULL,
                                                        G_PARAM_READWRITE | G_PARAM_CONSTRUCT_ONLY));
  
  /**
   * GtkUniqueApp:startup-id:
   *
   * The startup notification id used by the application instance.
   **/
  g_object_class_install_property (gobject_class,
                                   PROP_STARTUP_ID,
                                   g_param_spec_string ("startup-id",
                                                        "Startup Id",
                                                        "The startup id of the application",
                                                        NULL,
                                                        G_PARAM_READWRITE | G_PARAM_CONSTRUCT_ONLY));
  
  /**
   * GtkUniqueApp:workspace:
   *
   * The workspace of the application.
   **/
  g_object_class_install_property (gobject_class,
                                   PROP_WORKSPACE,
                                   g_param_spec_uint ("workspace",
                                                      "Workspace",
                                                      "The workspace of the application",
                                                      0, G_MAXUINT,
                                                      0,
                                                      G_PARAM_READWRITE | G_PARAM_CONSTRUCT));
  
  /**
   * GtkUniqueApp:screen:
   *
   * The #GdkScreen of the application.
   **/
  g_object_class_install_property (gobject_class,
                                   PROP_SCREEN,
                                   g_param_spec_object ("screen",
                                                        "Screen",
                                                        "The screen of the application",
                                                        GDK_TYPE_SCREEN,
                                                        G_PARAM_READWRITE | G_PARAM_CONSTRUCT));

  /**
   * GtkUniqueApp::message:
   * @app: the object that received the signal
   * @command: the command received
   * @command_data: data passed to the command or %NULL
   * @startup_id: start-up id of the instance sending us the command
   * @screen: the #GdkScreen of the instance sending us the command
   * @workspace: workspace of the instance sending us the command
   *
   * This signal is emitted each time a #GtkUniqueApp receives a
   * command from another #GtkUniqueApp instance with the same name.
   * You should decide which action you application should implement
   * for each #GtkUniqueCommand it may receive.  You may also use the
   * @workspace, @screen and @startup_id to handle the window screen
   * positionment and the startup notification sequence.
   *
   * Return value: a #GtkUniqueResponse value, depending on how the
   *   #GtkUniqueCommand received was handled.
   */
  unique_app_signals[MESSAGE] =
    g_signal_new ("message",
                  G_TYPE_FROM_CLASS (klass),
                  G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS,
                  G_STRUCT_OFFSET (GtkUniqueAppClass, message),
                  message_accumulator, NULL,
                  gtkunique_marshal_ENUM__ENUM_STRING_STRING_OBJECT_UINT,
                  GTK_TYPE_UNIQUE_RESPONSE,
                  5,
                  GTK_TYPE_UNIQUE_COMMAND,
                  G_TYPE_STRING,
                  G_TYPE_STRING,
                  GDK_TYPE_SCREEN,
                  G_TYPE_UINT);

  g_type_class_add_private (klass, sizeof (GtkUniqueAppPrivate));
}

static void
gtk_unique_app_init (GtkUniqueApp *app)
{
  GtkUniqueAppPrivate *priv;
  GtkUniqueAppObject *impl;

  priv = app->priv = G_TYPE_INSTANCE_GET_PRIVATE (app,
                                                  GTK_TYPE_UNIQUE_APP,
                                                  GtkUniqueAppPrivate);

  impl = g_object_new (_gtk_unique_app_impl_get_type (), NULL);
  impl->parent = app;

  priv->impl = impl;
}

/**
 * gtk_unique_app_new_with_id:
 * @name: the name of the application
 * @startup_id: the startup id or %NULL
 *
 * Creates a new #GtkUniqueApp instance for @name passing a start-up
 * id @id.  The name must be a unique identifier for the application,
 * and must be in form of a domain name, like org.gnome.YourApplication.
 *
 * Once you have created a #GtkUniqueApp instance you should check if
 * any other instance is running, using gtk_unique_app_is_running().
 * If another instance is running you can send a command to it, using
 * the gtk_unique_app_send_message() function or one of its convience
 * wrappers; after that you should quit. If no other instance is
 * running, you can follow the usual application instance sequence;
 * when you create a top-level window for you application you must
 * let the #GtkUniqueApp instance "watch" it, by using the function
 * gtk_unique_app_add_window().
 * 
 * Return value: the newly created #GtkUniqueApp instance.  Use
 *   g_object_unref() when finished.
 */
GtkUniqueApp *
gtk_unique_app_new_with_id (const gchar *name,
                            const gchar *startup_id)
{
  g_return_val_if_fail (name != NULL, NULL);

  return g_object_new (GTK_TYPE_UNIQUE_APP,
                       "name", name,
                       "startup-id", startup_id,
                       NULL);
}

/* taken from nautilus */
static guint32
slowly_and_stupidly_obtain_timestamp (GdkDisplay *display)
{
  Display *xdisplay;
  Window xwindow;
  XEvent event;
  XSetWindowAttributes attrs;
  Atom atom_name;
  Atom atom_type;
  char *name;

  xdisplay = GDK_DISPLAY_XDISPLAY (display);

  attrs.override_redirect = True;
  attrs.event_mask = PropertyChangeMask | StructureNotifyMask;

  xwindow = XCreateWindow (xdisplay, RootWindow (xdisplay, 0),
                           -100, -100, 1, 1,
                           0,
                           CopyFromParent,
                           CopyFromParent,
                           CopyFromParent,
                           CWOverrideRedirect | CWEventMask,
                           &attrs);

  atom_name = XInternAtom (xdisplay, "WM_NAME", TRUE);
  g_assert (atom_name != None);
  atom_type = XInternAtom (xdisplay, "STRING", TRUE);
  g_assert (atom_type != None);

  name = "Fake Window";
  XChangeProperty (xdisplay, xwindow, atom_name, atom_type,
		   8, PropModeReplace,
                   (unsigned char *) name, strlen (name));

  XWindowEvent (xdisplay, xwindow,
                PropertyChangeMask,
                &event);

  XDestroyWindow(xdisplay, xwindow);

  return event.xproperty.time;
}

/**
 * gtk_unique_app_new:
 * @name: the name of the application's instance
 *
 * Creates a new #GtkUniqueApp instance for @name.  The name must be
 * a unique identifier for the application, and must be in form of
 * a path, like /org/gnome/YourApplication.  Once you have created
 * a #GtkUniqueApp instance you should check if any other instance
 * is running, using gtk_unique_app_is_running().  If another instance
 * is running you can send a command to it, using the
 * gtk_unique_app_send_message() function or one of its convience
 * wrappers.
 * 
 * Return value: the newly created #GtkUniqueApp instance.
 */
GtkUniqueApp *
gtk_unique_app_new (const gchar *name)
{
  GdkDisplay *display;
  guint32 timestamp;
  gchar *fake_id;
  GtkUniqueApp *retval;

  g_return_val_if_fail (name != NULL, NULL);

  display = gdk_display_get_default ();
  timestamp = slowly_and_stupidly_obtain_timestamp (display);
  fake_id = g_strdup_printf ("_TIME%lu", (unsigned long) timestamp);

  retval = gtk_unique_app_new_with_id (name, fake_id);
  g_free (fake_id);

  return retval;
}

/**
 * gtk_unique_app_is_running:
 * @app: a #GtkUniqueApp
 *
 * Checks whether an instance of #GtkUniqueApp with the same name
 * passed to gtk_unique_app_new() or gtk_unique_app_new_with_id()
 * is already running.
 *
 * Return value: %TRUE if another instance is running.
 */
gboolean
gtk_unique_app_is_running (GtkUniqueApp *app)
{
  GtkUniqueAppObject *impl;

  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), FALSE);

  impl = app->priv->impl;

  if (!GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->is_running)
    {
      g_warning ("Attempting to send message, but backend of type `%s' "
                 "does not implement GtkUniqueAppObject::is_running",
                 g_type_name (G_OBJECT_TYPE (impl)));
      return FALSE;
    }

  return GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->is_running (impl);
}

/**
 * gtk_unique_app_add_window:
 * @app: a #GtkUniqueApp
 * @window: a #GtkWindow
 *
 * Adds @window to the list of windows watched by @app. You
 * should add every newly created main window of your application
 * to a #GtkUniqueApp instance, and then remove it when the
 * window is destroyed.
 */
void
gtk_unique_app_add_window (GtkUniqueApp *app,
                           GtkWindow    *window)
{
  GtkUniqueAppObject *impl;

  g_return_if_fail (GTK_IS_UNIQUE_APP (app));
  g_return_if_fail (GTK_IS_WINDOW (window));

  impl = app->priv->impl;

  if (GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->add_window)
    GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->add_window (impl, window);
}

/**
 * gtk_unique_app_remove_window:
 * @app: a #GtkUniqueApp
 * @window: a #GtkWindow
 *
 * Removes @window from the list of windows watched by @app.
 */
void
gtk_unique_app_remove_window (GtkUniqueApp *app,
                              GtkWindow    *window)
{
  GtkUniqueAppObject *impl;

  g_return_if_fail (GTK_IS_UNIQUE_APP (app));
  g_return_if_fail (GTK_IS_WINDOW (window));

  impl = app->priv->impl;

  if (GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->remove_window)
    GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->remove_window (impl, window);
}

/**
 * gtk_unique_app_list_windows:
 * @app: a #GtkUniqueApp
 *
 * Retrieves the list of windows watched by @app.
 *
 * Return value: a list of windows.  You should free the list with
 *   g_slist_free() when done.
 */
GSList *
gtk_unique_app_list_windows (GtkUniqueApp *app)
{
  GtkUniqueAppObject *impl;

  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), NULL);

  impl = app->priv->impl;

  if (GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->list_windows)
    return GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->list_windows (impl);

  return NULL;
}

/**
 * gtk_unique_app_send_message:
 * @app: a #GtkUniqueApp
 * @command: a command you want to send
 * @data: optional data for the command, or %NULL
 *
 * Sends @command to an existing instance of #GtkUniqueApp with the
 * same name used to create @app. If another instance exists it will
 * receive the "message" signal with the corresponding command and
 * data sent.
 *
 * You should rarely use this function. Unless you wish to send
 * a %GTK_UNIQUE_CUSTOM command, you should use the convenience
 * functions gtk_unique_app_new_document(), gtk_unique_app_open_uri()
 * and gtk_unique_app_activate() instead.
 *
 * Return value: a #GtkUniqueResponse
 */
GtkUniqueResponse
gtk_unique_app_send_message (GtkUniqueApp     *app,
                             GtkUniqueCommand  command,
                             const gchar      *data)
{
  GtkUniqueAppObject *impl;
  gchar *startup_id;
  guint workspace;
  GtkUniqueResponse response;

  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), GTK_UNIQUE_RESPONSE_FAIL);
  g_return_val_if_fail (IS_VALID_COMMAND (command), GTK_UNIQUE_RESPONSE_FAIL);

  impl = app->priv->impl;

  startup_id = impl->startup_id;
  workspace = impl->workspace;

  if (!GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->send_message)
    {
      g_warning ("Attempting to send message, but backend of type `%s' "
                 "does not implement GtkUniqueAppObject::send_message",
                 g_type_name (G_OBJECT_TYPE (impl)));
      return GTK_UNIQUE_RESPONSE_FAIL;
    }
  
  GTK_UNIQUE_APP_OBJECT_GET_CLASS (impl)->send_message (impl,
                                                        command, data,
                                                        &response);

  return response;
}

/**
 * gtk_unique_app_activate:
 * @app: a #GtkUniqueApp
 *
 * Sends the %GTK_UNIQUE_ACTIVATE command to an existing instance
 * of a #GtkUniqueApp with the same name used to create @app.
 *
 * Return value: a #GtkUniqueResponse
 */
GtkUniqueResponse
gtk_unique_app_activate (GtkUniqueApp *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), GTK_UNIQUE_RESPONSE_FAIL);

  return gtk_unique_app_send_message (app, GTK_UNIQUE_ACTIVATE, NULL);
}

/**
 * gtk_unique_app_new_document:
 * @app: a #GtkUniqueApp
 *
 * Sends the %GTK_UNIQUE_NEW command to an existing instance
 * of a #GtkUniqueApp with the same name used to create @app.
 *
 * Return value: a #GtkUniqueResponse
 */
GtkUniqueResponse
gtk_unique_app_new_document (GtkUniqueApp *app)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), GTK_UNIQUE_RESPONSE_FAIL);

  return gtk_unique_app_send_message (app, GTK_UNIQUE_NEW, NULL);
}

/**
 * gtk_unique_app_open_uri:
 * @app: a #GtkUniqueApp
 * @uri: a valid URI, or %NULL
 *
 * Sends the %GTK_UNIQUE_OPEN command to an existing instance
 * of a #GtkUniqueApp with the same name used to create @app.
 *
 * Return value: a #GtkUniqueResponse
 */
GtkUniqueResponse
gtk_unique_app_open_uri (GtkUniqueApp *app,
                         const gchar  *uri)
{
  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), GTK_UNIQUE_RESPONSE_FAIL);

  return gtk_unique_app_send_message (app, GTK_UNIQUE_OPEN, uri);
}


GtkUniqueResponse
_gtk_unique_app_emit_message (GtkUniqueApp     *app,
                              GtkUniqueCommand  command,
                              const gchar      *data,
                              const gchar      *startup_id,
                              GdkScreen        *screen,
                              guint             workspace)
{
  GtkUniqueResponse response;

  g_return_val_if_fail (GTK_IS_UNIQUE_APP (app), GTK_UNIQUE_RESPONSE_FAIL);
  g_return_val_if_fail (IS_VALID_COMMAND (command), GTK_UNIQUE_RESPONSE_FAIL);
  g_return_val_if_fail (GDK_IS_SCREEN (screen), GTK_UNIQUE_RESPONSE_FAIL);

  g_signal_emit (app, unique_app_signals[MESSAGE], 0,
                 command,
                 data,
                 startup_id,
                 screen,
                 workspace,
                 &response);

  return response;
}

gchar *
_gtk_unique_command_to_string (GtkUniqueCommand command)
{
  GEnumClass *enum_class;
  GEnumValue *enum_value;
  gboolean needs_unref = FALSE;
  gchar *retval;

  g_return_val_if_fail (IS_VALID_COMMAND (command), NULL);
  
  enum_class = g_type_class_peek (GTK_TYPE_UNIQUE_COMMAND);
  if (G_UNLIKELY (enum_class == NULL))
    {
      enum_class = g_type_class_ref (GTK_TYPE_UNIQUE_COMMAND);
      needs_unref = TRUE;
    }

  g_assert (enum_class != NULL);
  
  enum_value = g_enum_get_value (enum_class, command);
  retval = g_strdup (enum_value->value_nick);

  if (G_UNLIKELY (needs_unref))
    g_type_class_unref (enum_class);

  return retval;
}

GtkUniqueCommand
_gtk_unique_command_from_string (const gchar *command)
{
  GEnumClass *enum_class;
  GEnumValue *enum_value;
  gboolean needs_unref = FALSE;
  GtkUniqueCommand retval = GTK_UNIQUE_INVALID;

  enum_class = g_type_class_peek (GTK_TYPE_UNIQUE_COMMAND);
  if (G_UNLIKELY (enum_class == NULL))
    {
      enum_class = g_type_class_ref (GTK_TYPE_UNIQUE_COMMAND);
      needs_unref = TRUE;
    }

  g_assert (enum_class != NULL);

  enum_value = g_enum_get_value_by_nick (enum_class, command);
  if (enum_value)
    retval = (GtkUniqueCommand) enum_value->value;

  if (G_UNLIKELY (needs_unref))
    g_type_class_unref (enum_class);

  return retval;
}

gchar *
_gtk_unique_response_to_string (GtkUniqueResponse response)
{
  GEnumClass *enum_class;
  GEnumValue *enum_value;
  gboolean needs_unref = FALSE;
  gchar *retval;

  g_return_val_if_fail (IS_VALID_RESPONSE (response), NULL);
  
  enum_class = g_type_class_peek (GTK_TYPE_UNIQUE_RESPONSE);
  if (G_UNLIKELY (enum_class == NULL))
    {
      enum_class = g_type_class_ref (GTK_TYPE_UNIQUE_RESPONSE);
      needs_unref = TRUE;
    }

  g_assert (enum_class != NULL);
  
  enum_value = g_enum_get_value (enum_class, response);
  retval = g_strdup (enum_value->value_nick);

  if (G_UNLIKELY (needs_unref))
    g_type_class_unref (enum_class);

  return retval;
}

GtkUniqueResponse
_gtk_unique_response_from_string (const gchar *response)
{
  GEnumClass *enum_class;
  GEnumValue *enum_value;
  gboolean needs_unref = FALSE;
  GtkUniqueResponse retval = GTK_UNIQUE_RESPONSE_INVALID;

  enum_class = g_type_class_peek (GTK_TYPE_UNIQUE_RESPONSE);
  if (G_UNLIKELY (enum_class == NULL))
    {
      enum_class = g_type_class_ref (GTK_TYPE_UNIQUE_RESPONSE);
      needs_unref = TRUE;
    }

  g_assert (enum_class != NULL);

  enum_value = g_enum_get_value_by_nick (enum_class, response);
  if (enum_value)
    retval = (GtkUniqueResponse) enum_value->value;

  if (G_UNLIKELY (needs_unref))
    g_type_class_unref (enum_class);

  return retval;
}
