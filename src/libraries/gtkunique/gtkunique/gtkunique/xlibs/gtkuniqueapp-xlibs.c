/* GtkUnique - Single Instance Application library
 * gtkuniqueapp-xlibs.c: Xlibs-based implementation of GtkUniqueApp
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
#include <gdk/gdkx.h>
#include <gtk/gtk.h>
#include <X11/Xatom.h>
#include <errno.h>

#include "../gtkuniqueinternals.h"
#include "gtkuniqueapp-xlibs.h"
#include "gtkuniqueutils-xlibs.h"

struct _GtkUniqueAppXlibs
{
  GtkUniqueAppObject parent_instance;

  Display *xdisplay;
  Atom atoms[GTK_UNIQUE_N_ATOMS];

  gchar *lock_string;

  GSList *windows;
};

struct _GtkUniqueAppXlibsClass
{
  GtkUniqueAppObjectClass parent_class;
};

G_DEFINE_TYPE (GtkUniqueAppXlibs,
               _gtk_unique_app_xlibs,
               GTK_TYPE_UNIQUE_APP_OBJECT);

static inline void
_gtk_unique_app_xlibs_atoms_init (GtkUniqueAppXlibs *app)
{
  /* keep in sync with the GtkUniqueXlibsAtom enum or
   * whole hell will be unleashed on earth.
   */
  static const char *atoms_name[] =
  {
    "_GTK_UNIQUE_VERSION",
    "_GTK_UNIQUE_NAME",
    "_GTK_UNIQUE_STARTUP_ID",
    "_GTK_UNIQUE_SCREEN",
    "_GTK_UNIQUE_WORKSPACE",
    "_GTK_UNIQUE_COMMAND",
    "_GTK_UNIQUE_COMMAND_DATA",
    "_GTK_UNIQUE_LOCK",
    "_GTK_UNIQUE_RESPONSE",

    "_GTK_UNIQUE_SELECTION_LOCK",
    "WM_STATE",
    "UTF8_STRING",
    "_NET_CLIENT_LIST",
  };

  XInternAtoms (app->xdisplay,
                (char **) atoms_name, GTK_UNIQUE_N_ATOMS,
                False,
                app->atoms);
}

static void *
get_win_prop_data_and_validate (Display      *xdisplay,
                                Window        xwin, 
				Atom          prop, 
				Atom          type, 
				int           expected_format,
				unsigned int  expected_n_items,
				unsigned int *n_items_ret)
{
  Atom type_ret;
  int format;
  unsigned long n_items, bytes_after;
  unsigned char *data_return = 0;
  int status, err;

  gdk_error_trap_push ();

  status = XGetWindowProperty (xdisplay, xwin, 
			       prop, 
			       0, G_MAXLONG, 
			       False,
			       type, 
			       &type_ret, &format, &n_items, &bytes_after, 
			       &data_return);

  err = gdk_error_trap_pop ();

  if (err != Success || status != Success)
    goto fail;

  if (!data_return)
    goto fail;

  if (expected_format && format != expected_format)
    goto fail;

  if (expected_n_items && n_items != expected_n_items)
    goto fail;

  if (n_items_ret)
    *n_items_ret = n_items;
  
  return data_return;

fail:
  if (data_return)
    XFree (data_return);

  return NULL;
}

static void *
steal_win_prop_data_and_validate (Display      *xdisplay,
                                  Window        xwin, 
                                  Atom          prop, 
                                  Atom          type, 
                                  int           expected_format,
                                  unsigned int  expected_n_items,
                                  unsigned int *n_items_ret)
{
  Atom type_ret;
  int format;
  unsigned long n_items, bytes_after;
  unsigned char *data_return = 0;
  int status, err;

  gdk_error_trap_push ();

  status = XGetWindowProperty (xdisplay, xwin, 
			       prop, 
			       0, G_MAXLONG, 
			       True,
			       type, 
			       &type_ret, &format, &n_items, &bytes_after, 
			       &data_return);

  err = gdk_error_trap_pop ();

  if (err != Success || status != Success)
    goto fail;

  if (!data_return)
    goto fail;

  if (expected_format && format != expected_format)
    goto fail;

  if (expected_n_items && n_items != expected_n_items)
    goto fail;

  if (n_items_ret)
    *n_items_ret = n_items;
  
  return data_return;

fail:
  if (data_return)
    XFree (data_return);

  return NULL;
}

static Window
look_for_hint_in_children (Display *xdisplay,
                           Window   xwindow,
                           Atom     hint)
{
  Window root, parent;
  Window *children;
  unsigned int nchildren;
  unsigned int i;
  Atom type = None;
  int format;
  unsigned long n_items, bytes_after;
  unsigned char *data_return = 0;
  Window retval = None;

  if (!XQueryTree (xdisplay, xwindow, &root, &parent, &children, &nchildren))
    return None;

  for (i = 0; i < nchildren; i++)
    {
      int res, err;

      gdk_error_trap_push ();

      res = XGetWindowProperty (xdisplay, children[i],
                                hint,
                                0, 0, False,
                                AnyPropertyType,
                                &type, &format, &n_items, &bytes_after,
                                &data_return);
      
      err = gdk_error_trap_pop ();
      
      if (err == Success && res == Success && type)
        {
          retval = children[i];
          break;
        }
    }

  if (retval == None)
    {
      for (i = 0; i < nchildren; i++)
        {
          retval = look_for_hint_in_children (xdisplay, children[i], hint);
          if (retval)
            break;
        }
    }

  if (children)
    XFree ((char *) children);

  return retval;
}

static Window
look_for_hint (Display *xdisplay,
               Window   xwindow,
               Atom     hint)
{
  Atom type = None;
  int format, err, status;
  unsigned long n_items, bytes_after;
  unsigned char *data_return = 0;
  Window inner_window;

  gdk_error_trap_push ();

  status = XGetWindowProperty (xdisplay, xwindow,
                               hint,
        		       0, 1, False, AnyPropertyType,
        		       &type, &format,
                               &n_items, &bytes_after,
                               &data_return);

  err = gdk_error_trap_pop ();

  if (err != Success || status != Success)
    return None;

  if (type)
    return xwindow;

  inner_window = look_for_hint_in_children (xdisplay, xwindow, hint);
  if (inner_window)
    return inner_window;

  return xwindow;
}

static gchar *
check_string_property (GtkUniqueAppXlibs   *app,
                       Window               xwindow,
                       GtkUniqueXlibsAtom   property)
{
  unsigned char *data_return = 0;
  gchar *retval = NULL;
  
  data_return =
    get_win_prop_data_and_validate (app->xdisplay, xwindow,
                                    app->atoms[property],
                                    XA_STRING, 8, 0,
                                    NULL);
  if (data_return && *data_return)
    {
      retval = g_strdup ((char *) data_return);

      XFree (data_return);
    }

  return retval;
}

static void
hold_selection (Display  *xdisplay,
                Atom      selection_atom,
                gboolean  hold)
{
  static GtkWidget *selection_window = NULL;

  if (hold)
    {
      GdkCursor *cursor;

      g_assert (selection_window == NULL);

      XGrabServer (xdisplay);
      if (XGetSelectionOwner (xdisplay, selection_atom) != None)
        goto out;

      selection_window = gtk_invisible_new ();
      gtk_widget_show (selection_window);

      if (!gtk_selection_owner_set (selection_window,
                                    gdk_x11_xatom_to_atom (selection_atom),
                                    GDK_CURRENT_TIME))
        {
          gtk_widget_destroy (selection_window);
          selection_window = NULL;
          goto out;
        }

      cursor = gdk_cursor_new (GDK_WATCH);
      gdk_pointer_grab (selection_window->window,
                        FALSE, 0, NULL, 
                        cursor,
                        GDK_CURRENT_TIME);
      gdk_cursor_unref (cursor);

out:
      gdk_flush ();
      XUngrabServer (xdisplay);

      return;
    }
  else
    {
      g_assert (selection_window != NULL);

      gtk_widget_destroy (selection_window);
      selection_window = NULL;

      gdk_flush ();

      return;
    }
}

static Window
find_window (GtkUniqueAppXlibs *app,
             const gchar       *name)
{
  Window *children;
  unsigned int screen_count, n_children, i, j;
  Window root;
  Window retval;

  /* we hold a selection while we spin through the
   * windows; this allows us to avoid race conditions
   * with two GtkUniqueApp instances in two different
   * processes reaching the gtk_unique_app_is_running()
   * check at the same time.
   */
  hold_selection (app->xdisplay,
                  app->atoms[GTK_UNIQUE_ATOM_SELECTION_LOCK],
                  TRUE);

  screen_count = ScreenCount (app->xdisplay);
  for (i = 0; i < screen_count; i++)
    {
      root = RootWindow (app->xdisplay, i);

      children =
        get_win_prop_data_and_validate (app->xdisplay, root,
                                        app->atoms[GTK_UNIQUE_NET_CLIENT_LIST],
                                        XA_WINDOW, 32, 0,
                                        &n_children);
      if (G_UNLIKELY (children == NULL))
        {
          int res;
          Window root2, parent;

          res = XQueryTree (app->xdisplay, root, &root2,
                            &parent,
                            &children, &n_children);
          if (res == 0)
            {
              return None;
            }
        }
      
      retval = None;
      for (j = n_children - 1; j > 0; j--)
        {
          Window xwindow;
          gchar *str;

          xwindow = children[j];
          xwindow = look_for_hint (app->xdisplay, xwindow,
                                   app->atoms[GTK_UNIQUE_ATOM_WM_STATE]);

          /* check version */
          str = check_string_property (app, xwindow, GTK_UNIQUE_ATOM_VERSION);
          if (!str)
            continue;

          if (strcmp (str, GTK_UNIQUE_PROTOCOL_VERSION) != 0)
            {
              g_free (str);
              continue;
            }

          g_free (str);
      
          /* check name */
          str = check_string_property (app, xwindow, GTK_UNIQUE_ATOM_NAME);
          if (!str)
            continue;

          if (strcmp (str, name) != 0)
            {
              g_free (str);
              continue;
            }
      
          g_free (str);

          /* if it has survived all the checks, then it's our window */
          retval = xwindow;
        }

      if (retval != None)
        break;
    }
  
  /* the window check has been completed */
  hold_selection (app->xdisplay,
                  app->atoms[GTK_UNIQUE_ATOM_SELECTION_LOCK],
                  FALSE);

  if (children)
    XFree (children);

  return retval;
}

static gchar *
build_lock_string (void)
{
  gchar *retval;

  retval = g_strdup_printf ("%s-%s-%d",
                            g_get_host_name (),
                            g_get_user_name (),
                            (int) getpid ());

  return retval;
}

static void
add_string_property (GtkUniqueAppXlibs  *app,
                     Window              win,
                     GtkUniqueXlibsAtom  property,
                     const gchar        *value)
{
  int err;

  gdk_error_trap_push ();

  XChangeProperty (app->xdisplay, win,
                   app->atoms[property],
                   XA_STRING, 8,
                   PropModeReplace,
                   (unsigned char *) value, strlen (value));

  err = gdk_error_trap_pop ();
  if (err != Success)
    g_warning ("X error: %d", err);
}

#define MAX_TRIES       10

static gboolean
lock_window (GtkUniqueAppXlibs *app,
             Window             win)
{
  gboolean locked = FALSE;
  gint tries = 0;

  if (G_UNLIKELY (!app->lock_string))
    app->lock_string = build_lock_string ();

  do
    {
      int res, err;
      Atom type;
      int format;
      unsigned long n_items, bytes_after;
      unsigned char *data_return = 0;

      XGrabServer (app->xdisplay);

      gdk_error_trap_push ();

      res = XGetWindowProperty (app->xdisplay, win,
                                app->atoms[GTK_UNIQUE_ATOM_LOCK],
                                0, G_MAXLONG,
                                False,
                                XA_STRING,
                                &type, &format, &n_items, &bytes_after,
                                &data_return);
      
      err = gdk_error_trap_pop ();

      if (err || res != Success || type == None)
        {
          /* no lock found, lock */
          XChangeProperty (app->xdisplay, win,
                           app->atoms[GTK_UNIQUE_ATOM_LOCK],
                           XA_STRING, 8,
                           PropModeReplace,
                           (unsigned char *) app->lock_string,
                           strlen (app->lock_string));

          locked = TRUE;
        }

      XSync (app->xdisplay, False);
      XUngrabServer (app->xdisplay);

      if (!locked)
        {
#if 0
          /* FIXME - lock was already acquired by someone else.
           * we have to wait for a PropertyDelete event on the
           * window for the lock property and then try again.
           */
          g_debug ("Lock already held by %s",
                   data_return ? (char *) data_return
                               : "<unknown>");
#endif
        }

      if (data_return)
        XFree (data_return);
    } while (tries++ != MAX_TRIES || !locked);

  return locked;
}

static gboolean
send_command (GtkUniqueAppXlibs *app,
              Window             win,
              const gchar       *startup_id,
              guint              screen,
              guint              workspace,
              GtkUniqueCommand   command,
              const gchar       *data,
              GtkUniqueResponse *response)
{
  int err;
  gchar *cmd;
  gboolean done = FALSE;

  cmd = _gtk_unique_command_to_string (command);

#if 0
  g_debug ("Sending command `%s' (id:%d, data:`%s') "
           "to window 0x%x (name:%s, sid:%s, ws:%d) ",
           cmd, command, data,
           (unsigned int) win,
           _gtk_unique_app_get_name (GTK_UNIQUE_APP (app)),
           startup_id ? startup_id : "<null>",
           workspace);
#endif

  gdk_error_trap_push ();

  /* set the startup id, if present */
  if (startup_id && startup_id[0] != '\0')
    {
      XChangeProperty (app->xdisplay, win,
                       app->atoms[GTK_UNIQUE_ATOM_STARTUP_ID],
                       XA_STRING, 8,
                       PropModeReplace,
                       (unsigned char *) startup_id, strlen (startup_id));
    }
  
  /* set the screen number */
  XChangeProperty (app->xdisplay, win,
                   app->atoms[GTK_UNIQUE_ATOM_SCREEN],
                   XA_CARDINAL, 32,
                   PropModeReplace,
                   (unsigned char *) &screen, 1);

  /* set the workspace */
  XChangeProperty (app->xdisplay, win,
                   app->atoms[GTK_UNIQUE_ATOM_WORKSPACE],
                   XA_CARDINAL, 32,
                   PropModeReplace,
                   (unsigned char *) &workspace, 1);

  /* set the command's data, if present */
  if (data && data[0] != '\0')
    {
      XChangeProperty (app->xdisplay, win,
                       app->atoms[GTK_UNIQUE_ATOM_COMMAND_DATA],
                       XA_STRING, 8,
                       PropModeReplace,
                       (unsigned char *) data, strlen (data));
    }
  
  /* finally, set the command */
  XChangeProperty (app->xdisplay, win,
                   app->atoms[GTK_UNIQUE_ATOM_COMMAND],
                   XA_STRING, 8,
                   PropModeReplace,
                   (unsigned char *) cmd, strlen (cmd));
  
  err = gdk_error_trap_pop ();

  g_free (cmd);

  if (err != Success)
    {
      if (response)
        *response = GTK_UNIQUE_RESPONSE_FAIL;

      return FALSE;
    }

  while (!done)
    {
      XEvent event;

      XNextEvent (app->xdisplay, &event);

      if (event.xany.type == DestroyNotify &&
          event.xdestroywindow.window == win)
        {
          g_warning ("Window 0x%x was destroyed while waiting for response",
                     (unsigned int) win);
          
          if (response)
            *response = GTK_UNIQUE_RESPONSE_FAIL;
              
          done = TRUE;
        }
      else if (event.xany.type == PropertyNotify &&
               event.xproperty.state == PropertyNewValue &&
               event.xproperty.window == win &&
               event.xproperty.atom == app->atoms[GTK_UNIQUE_ATOM_RESPONSE])
        {
          char *resp = 0;
          GtkUniqueResponse resp_id = GTK_UNIQUE_RESPONSE_FAIL;

          resp =
            steal_win_prop_data_and_validate (app->xdisplay, win,
                                              app->atoms[GTK_UNIQUE_ATOM_RESPONSE],
                                              XA_STRING, 8,
                                              0, NULL);

          if (resp && resp[0] != '\0')
            {
              resp_id = _gtk_unique_response_from_string ((char *) resp);
              XFree (resp);
            }

          if (response)
            *response = resp_id;

          done = TRUE;
        }
      else if (event.xany.type == PropertyNotify &&
               event.xproperty.window == win &&
               event.xproperty.state == PropertyDelete &&
               event.xproperty.atom == app->atoms[GTK_UNIQUE_ATOM_COMMAND])
        {
#if 0
          g_debug ("Window 0x%x replied to our command",
                   (unsigned int) win);
#endif
        }
    }

  return TRUE; 
}

static void
unlock_window (GtkUniqueAppXlibs *app,
               Window             win)
{
  unsigned char *data = 0;

  data = steal_win_prop_data_and_validate (app->xdisplay, win,
                                           app->atoms[GTK_UNIQUE_ATOM_LOCK],
                                           XA_STRING, 8,
                                           0, NULL);
  if (!data || !*data)
    {
      g_warning ("Invalid data in lock property on window 0x%x",
                 (unsigned int) win);
      return;
    }
  
  if (strcmp ((char *) data, app->lock_string) != 0)
    {
      g_warning ("Lock on window 0x%x was stolen.  We were expecting `%s', "
                 "but we found `%s' instead",
                 (unsigned int) win,
                 app->lock_string,
                 (char *) data);
    }

  XFree (data);

  return;
}

static void
_gtk_unique_app_xlibs_send_message (GtkUniqueAppObject *app,
                                    GtkUniqueCommand    command,
                                    const gchar        *data,
                                    GtkUniqueResponse  *response)
{
  GtkUniqueAppXlibs *app_xlibs;
  Window xwindow;
  const gchar *startup_id, *name;
  GdkScreen *screen;
  guint workspace;
  gboolean res;

  app_xlibs = GTK_UNIQUE_APP_XLIBS (app);

  name = gtk_unique_app_object_get_name (app);
  startup_id = gtk_unique_app_object_get_startup_id (app);
  workspace = gtk_unique_app_object_get_workspace (app);
  screen = gtk_unique_app_object_get_screen (app);

  xwindow = find_window (app_xlibs, name);
  if (!xwindow)
    {
      g_warning ("No window found");
      return;
    }

  XSelectInput (app_xlibs->xdisplay,
                xwindow,
                (PropertyChangeMask | StructureNotifyMask));

  if (!lock_window (app_xlibs, xwindow))
    {
      g_warning ("Unable to acquire lock on the window, "
                 "aborting send message");
      return;
    }

  res = send_command (app_xlibs, xwindow,
                      startup_id,
                      gdk_screen_get_number (screen),
                      workspace,
                      command, data,
                      response);
  if (!res)
    {
      g_warning ("Unable to send message id %d", command);
    }

  unlock_window (app_xlibs, xwindow);
}

static gboolean
_gtk_unique_app_xlibs_is_running (GtkUniqueAppObject *app)
{
  GtkUniqueAppXlibs *app_xlibs;
  const gchar *name;

  app_xlibs = GTK_UNIQUE_APP_XLIBS (app);
  name = gtk_unique_app_object_get_name (app);

  return (find_window (app_xlibs, name) != None);
}

static gboolean
property_notify_cb (GtkWidget         *widget,
                    GdkEventProperty  *property_event,
                    GtkUniqueAppXlibs *app)
{
  GtkUniqueAppObject *app_object = GTK_UNIQUE_APP_OBJECT (app);

  if (property_event->state == GDK_PROPERTY_NEW_VALUE &&
      property_event->window == widget->window)
    {
      Atom cmd_atom = app->atoms[GTK_UNIQUE_ATOM_COMMAND];
      Atom lock_atom = app->atoms[GTK_UNIQUE_ATOM_LOCK];
      Atom resp_atom = app->atoms[GTK_UNIQUE_ATOM_RESPONSE];

      if (property_event->atom == gdk_x11_xatom_to_atom (cmd_atom))
        {
          /* we received a command */
          Window xwindow = GDK_WINDOW_XWINDOW (widget->window);
          unsigned char *data = 0;
          GtkUniqueCommand command;
          gchar *sid = NULL;
          gchar *cmd_data = NULL;
          guint ws = 0;
          GdkScreen *screen;
          GtkUniqueResponse response;
          gchar *resp;

          /* startup-id */
          data = steal_win_prop_data_and_validate (app->xdisplay, xwindow,
                                                   app->atoms[GTK_UNIQUE_ATOM_STARTUP_ID],
                                                   XA_STRING, 8,
                                                   0, NULL);
          if (data && *data != '\0')
            {
              sid = g_strdup ((char *) data);
              
              XFree (data);
              data = 0;
            }

          /* screen */
          data = steal_win_prop_data_and_validate (app->xdisplay, xwindow,
                                                   app->atoms[GTK_UNIQUE_ATOM_SCREEN],
                                                   XA_CARDINAL, 32,
                                                   0, NULL);
          if (data)
            {
              guint screen_number = (guint) *data;
              GdkDisplay *display = gdk_display_get_default ();

              screen = gdk_display_get_screen (display, screen_number);

              XFree (data);
            }

          /* workspace */
          data = steal_win_prop_data_and_validate (app->xdisplay, xwindow,
                                                   app->atoms[GTK_UNIQUE_ATOM_WORKSPACE],
                                                   XA_CARDINAL, 32,
                                                   0, NULL);
          if (data)
            {
              ws = (guint) *data;
              XFree (data);
            }

          /* command data */
          data = steal_win_prop_data_and_validate (app->xdisplay, xwindow,
                                                   app->atoms[GTK_UNIQUE_ATOM_COMMAND_DATA],
                                                   XA_STRING, 8,
                                                   0, NULL);
          if (data && *data != '\0')
            {
              cmd_data = g_strdup ((char *) data);

              XFree (data);
              data = 0;
            }

          /* command */
          data = steal_win_prop_data_and_validate (app->xdisplay, xwindow,
                                                   cmd_atom,
                                                   XA_STRING, 8,
                                                   0, NULL);
          if (!data || !*data)
            {
              g_warning ("Wrong data found on the window");

              g_free (sid);
              g_free (cmd_data);
              
              return FALSE;
            }

          command = _gtk_unique_command_from_string ((char *) data);
          if (command == GTK_UNIQUE_INVALID)
            {
              g_warning ("Unrecognised command: %s",
                         (char *) data);

              g_free (sid);
              g_free (cmd_data);
              XFree (data);

              return FALSE;
            }

          XFree (data);

          /* emit the "message" signal with the data we
           * gathered from the the X properties, and get
           * the response code we accumulated from the
           * signal handlers.
           */
          response = _gtk_unique_app_emit_message (app_object->parent,
                                                   command, cmd_data,
                                                   sid, screen, ws);

          if (cmd_data)
            g_free (cmd_data);

          /* put the response code in the response property */
          resp = _gtk_unique_response_to_string (response);

          XChangeProperty (app->xdisplay, xwindow,
                           resp_atom,
                           XA_STRING, 8,
                           PropModeReplace,
                           (unsigned char *) resp, strlen (resp));
          g_free (resp);

          XSync (app->xdisplay, False);
          gdk_flush ();
          
          return TRUE;
        }
      else if (property_event->atom == gdk_x11_xatom_to_atom (lock_atom))
        {
          /* someone locked the window */
          return TRUE;
        }
      else if (property_event->atom == gdk_x11_xatom_to_atom (resp_atom))
        {
          /* client accepted the command */
          return TRUE;
        }
    }

  return FALSE;
}

static void
realize_cb (GtkWidget         *widget,
            GtkUniqueAppXlibs *app)
{
  GtkUniqueAppObject *object = (GtkUniqueAppObject *) app;
  GdkWindow *gdkwindow, *temp;
  Window xwindow;

  gdkwindow = widget->window;
  if (G_UNLIKELY (!gdkwindow))
    {
      g_warning ("No GdkWindow found on widget of type `%s'",
                 g_type_name (G_OBJECT_TYPE (widget)));
      return;
    }

  temp = gdkwindow;
  while (temp)
    {
      temp = gdk_window_get_parent (gdkwindow);
      if (!temp || temp == GDK_ROOT_PARENT ())
        break;

      gdkwindow = temp;
    }

  /* add the version and name strings on the newly realized
   * window.
   *
   * TODO - the protocol version should really be stored as
   * a XA_CARDINAL property, to allow version checking like:
   *
   *   version = get_version (app);
   *   if (version < GTK_UNIQUE_PROTOCOL_VERSION)
   *     {
   *       protocol version used by app is older
   *       than what we implement here - app has
   *       been linked to an old GtkUnique version
   *     }
   *   else
   *     {
   *       protocol version used is newer than
   *       what we implement
   *     }
   */
  xwindow = GDK_WINDOW_XWINDOW (gdkwindow);
  add_string_property (app,
                       xwindow,
                       GTK_UNIQUE_ATOM_VERSION,
                       GTK_UNIQUE_PROTOCOL_VERSION);
  add_string_property (app,
                       xwindow,
                       GTK_UNIQUE_ATOM_NAME,
                       object->name);
}

static void
destroy_cb (GtkWidget         *widget,
            GtkUniqueAppXlibs *app)
{
  app->windows = g_slist_remove (app->windows, widget);
  g_signal_handlers_disconnect_by_func (widget,
                                        G_CALLBACK (property_notify_cb),
                                        app);
}

static void
_gtk_unique_app_xlibs_add_window (GtkUniqueAppObject *app,
                                  GtkWindow          *window)
{
  GtkUniqueAppXlibs *app_xlibs;

  app_xlibs = GTK_UNIQUE_APP_XLIBS (app);

  if (g_slist_find (app_xlibs->windows, window))
    {
      g_warning ("This window has already been added");
      return;
    }

  app_xlibs->windows = g_slist_prepend (app_xlibs->windows, window);
  
  /* attach a property notify callback, so that we can emit
   * the GtkUniqueApp::message signal when a window we watch
   * gets a command; this will get removed when we remove
   * the window or when we finalize the GtkUniqueApp object.
   * we also need to add the properties of the protocol so
   * we connect to the realize signal and add those properties
   * there.
   */
  gtk_widget_add_events (GTK_WIDGET (window), GDK_PROPERTY_CHANGE_MASK);
  g_signal_connect (window, "realize",
                    G_CALLBACK (realize_cb),
                    app_xlibs);
  g_signal_connect (window, "property-notify-event",
                    G_CALLBACK (property_notify_cb),
                    app_xlibs);
  g_signal_connect (window, "destroy",
                    G_CALLBACK (destroy_cb),
                    app_xlibs);
}

static void
_gtk_unique_app_xlibs_remove_window (GtkUniqueAppObject *app,
                                     GtkWindow          *window)
{
  GtkUniqueAppXlibs *app_xlibs;

  app_xlibs = GTK_UNIQUE_APP_XLIBS (app);

  if (!g_slist_find (app_xlibs->windows, window))
    {
      g_warning ("This window was not added");
      return;
    }

  app_xlibs->windows = g_slist_remove (app_xlibs->windows, window);

  g_signal_handlers_disconnect_by_func (window,
                                        G_CALLBACK (property_notify_cb),
                                        app_xlibs);
}

static GSList *
_gtk_unique_app_xlibs_list_windows (GtkUniqueAppObject *app)
{
  GtkUniqueAppXlibs *app_xlibs;
  GSList *retval, *l;

  app_xlibs = GTK_UNIQUE_APP_XLIBS (app);

  for (retval = NULL, l = app_xlibs->windows; l != NULL; l = l->next)
    retval = g_slist_prepend (retval, l->data);

  return g_slist_reverse (retval);
}

static void
_gtk_unique_app_xlibs_finalize (GObject *gobject)
{
  GtkUniqueAppXlibs *app = GTK_UNIQUE_APP_XLIBS (gobject);
  GSList *l;
  
  for (l = app->windows; l != NULL; l = l->next)
    {
      GtkWindow *window = l->data;

      app->windows = g_slist_remove (app->windows, window);

      g_signal_handlers_disconnect_by_func (window,
                                            G_CALLBACK (property_notify_cb),
                                            app);
    }
  g_slist_free (app->windows);
  g_free (app->lock_string);

  G_OBJECT_CLASS (_gtk_unique_app_xlibs_parent_class)->finalize (gobject);
}

static void
_gtk_unique_app_xlibs_class_init (GtkUniqueAppXlibsClass *klass)
{
  GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
  GtkUniqueAppObjectClass *uniqueapp_class;
  
  uniqueapp_class = GTK_UNIQUE_APP_OBJECT_CLASS (klass);

  gobject_class->finalize = _gtk_unique_app_xlibs_finalize;

  uniqueapp_class->is_running = _gtk_unique_app_xlibs_is_running;
  uniqueapp_class->send_message = _gtk_unique_app_xlibs_send_message;
  uniqueapp_class->add_window = _gtk_unique_app_xlibs_add_window;
  uniqueapp_class->remove_window = _gtk_unique_app_xlibs_remove_window;
  uniqueapp_class->list_windows = _gtk_unique_app_xlibs_list_windows;
}

static void
_gtk_unique_app_xlibs_init (GtkUniqueAppXlibs *app)
{
  app->xdisplay = GDK_DISPLAY ();
  app->windows = NULL;
  
  _gtk_unique_app_xlibs_atoms_init (app);
}

GType
_gtk_unique_app_impl_get_type (void)
{
  return _gtk_unique_app_xlibs_get_type ();
}
