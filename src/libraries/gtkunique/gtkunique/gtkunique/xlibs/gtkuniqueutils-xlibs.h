/* GtkUnique - Single Instance Application library
 * gtkuniqueapp-xlibs.h: Utilities for the Xlibs-based backend
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
#ifndef __GTK_UNIQUE_UTILS_XLIBS_H__
#define __GTK_UNIQUE_UTILS_XLIBS_H__

#include <glib.h>
#include <X11/Xatom.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <gtkunique/gtkuniqueversion.h>

#define GTK_UNIQUE_PROTOCOL_VERSION     "1.0"

typedef enum {
  /* GtkUnique window protocol */
  GTK_UNIQUE_ATOM_VERSION,
  GTK_UNIQUE_ATOM_NAME,
  GTK_UNIQUE_ATOM_STARTUP_ID,
  GTK_UNIQUE_ATOM_SCREEN,
  GTK_UNIQUE_ATOM_WORKSPACE,
  GTK_UNIQUE_ATOM_COMMAND,
  GTK_UNIQUE_ATOM_COMMAND_DATA,
  GTK_UNIQUE_ATOM_LOCK,
  GTK_UNIQUE_ATOM_RESPONSE,
  
  /* utility atoms */
  GTK_UNIQUE_ATOM_SELECTION_LOCK,
  GTK_UNIQUE_ATOM_WM_STATE,
  GTK_UNIQUE_ATOM_UTF8_STRING,
  GTK_UNIQUE_NET_CLIENT_LIST,

  GTK_UNIQUE_N_ATOMS
} GtkUniqueXlibsAtom;


#endif /* __GTK_UNIQUE_UTILS_XLIBS_H__ */
