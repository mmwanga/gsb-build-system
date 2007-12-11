m4_define([gtkunique_major_version], [0])
m4_define([gtkunique_minor_version], [9])
m4_define([gtkunique_micro_version], [1])
m4_define([gtkunique_version],
          [gtkunique_major_version.gtkunique_minor_version.gtkunique_micro_version])
m4_define([gtkunique_api_version],
          [gtkunique_major_version.gtkunique_minor_version])
m4_define([gtkunique_interface_age], [0])
m4_define([gtkunique_binary_age],
          [m4_eval(100 * gtkunique_minor_version + gtkunique_micro_version)])
# This is the X.Y used in -lgtkunique-FOO-X.Y
m4_define([gtkunique_api_version], [1.0])

AC_PREREQ(2.52)

AC_INIT([gtkunique], [gtkunique_version],
        [ebassi@gnome.org],
        [gtkunique])

AC_CONFIG_SRCDIR([gtkunique/gtkunique.h])

AM_INIT_AUTOMAKE
AM_CONFIG_HEADER(config.h)

GTK_UNIQUE_MAJOR_VERSION=gtkunique_major_version
GTK_UNIQUE_MINOR_VERSION=gtkunique_minor_version
GTK_UNIQUE_MICRO_VERSION=gtkunique_micro_version
GTK_UNIQUE_VERSION=gtkunique_version
GTK_UNIQUE_API_VERSION=gtkunique_api_version
AC_SUBST(GTK_UNIQUE_MAJOR_VERSION)
AC_SUBST(GTK_UNIQUE_MINOR_VERSION)
AC_SUBST(GTK_UNIQUE_MICRO_VERSION)
AC_SUBST(GTK_UNIQUE_VERSION)
AC_SUBST(GTK_UNIQUE_API_VERSION)

m4_define([lt_current],
          [m4_eval(100 * gtkunique_minor_version + gtkunique_micro_version - gtkunique_interface_age)])
m4_define([lt_revision], [gtkunique_interface_age])
m4_define([lt_age], [m4_eval(gtkunique_binary_age - gtkunique_interface_age)])
LT_VERSION_INFO="lt_current:lt_revision:lt_age"
LT_CURRENT_MINUS_AGE=m4_eval(lt_current - lt_age)
AC_SUBST(LT_VERSION_INFO)
AC_SUBST(LT_CURRENT_MINUS_AGE)

AM_SANITY_CHECK
AM_MAINTAINER_MODE

dnl Checks for programs.
AC_ISC_POSIX
AC_PROG_CC
AC_PATH_XTRA
AM_PROG_CC_STDC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_C_CONST


# Honor aclocal flags
ACLOCAL="$ACLOCAL $ACLOCAL_FLAGS"

GLIB_REQUIRED=2.12.0
GTK_REQUIRED=2.10.0
GTK_RECOMMENDED=2.12.0
DBUS_GLIB_REQUIRED=0.70

CPPFLAGS="$CPPFLAGS -Werror -Wall -Wshadow -Wcast-align -Wno-uninitialized"

PKG_CHECK_MODULES(GTKUNIQUE, glib-2.0 >= $GLIB_REQUIRED dnl
                             gtk+-2.0 >= $GTK_REQUIRED)

# check if we are compiling against a newer version of GTK+
if $PKG_CONFIG --atleast-version=$GTK_RECOMMENDED gtk+-2.0; then
  have_new_gtk=yes
  AC_DEFINE([GTK_UNIQUE_HAVE_NEW_GTK], [1], [Building with newer GTK+])
else
  have_new_gtk=no
fi

AM_CONDITIONAL([HAVE_NEW_GTK], [test x$have_new_gtk = xyes])

# check if we are compiling with D-Bus support
if $PKG_CONFIG --atleast-version $DBUS_GLIB_REQUIRED dbus-glib-1; then
  have_dbus=yes
  PKG_CHECK_MODULES(DBUS, dbus-glib-1 >= $DBUS_GLIB_REQUIRED)
  AC_SUBST(DBUS_CFLAGS)
  AC_SUBST(DBUS_LIBS)
  AC_DEFINE([GTK_UNIQUE_HAVE_DBUS], [1], [Building with D-Bus support]) 
  AC_PATH_PROG(DBUS_BINDING_TOOL, dbus-binding-tool)
else
  have_dbus=no
fi

AM_CONDITIONAL([HAVE_DBUS], [test x$have_dbus = xyes])

AC_PROG_LIBTOOL
AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
AC_PATH_PROG(GLIB_GENMARSHAL, glib-genmarshal)

if test x$have_dbus = xyes; then
  gtkuniquebackend=dbus
else
  gtkuniquebackend=xlibs
fi

AC_ARG_WITH(backend,
            [  --with-backend=[[xlibs/dbus/bacon]] select default GtkUnique backend],
            gtkuniquebackend=$with_backend)

AC_SUBST(gtkuniquebackend)
case $gtkuniquebackend in
  xlibs|dbus|bacon) ;;
  *) AC_MSG_ERROR([Invalid backend for GUnique: use dbus, xlibs or bacon.]);;
esac

gtkuniquebackendlib=libgtkunique-$gtkuniquebackend-$GTK_UNIQUE_API_VERSION.la
AC_SUBST(gtkuniquebackendlib)

m4_define([debug_default],
          m4_if(m4_eval(gtkunique_minor_version % 2), [1], [maximum], [minimum]))

# declare --enable-* args and collect ac_help strings
AC_ARG_ENABLE(debug,
              AC_HELP_STRING([--enable-debug=@<:@no/minimum/maximum@:>@],
                             [turn on debugging @<:@default=debug_default@:>@]),,
              enable_debug=debug_default)

if test "x$enable_debug" = "xmaximum"; then
  test "$cflags_set" = set || CFLAGS="$CFLAGS -g"
  GTKUNIQUE_DEBUG_FLAGS="-DG_ENABLE_DEBUG"
else
  if test "x$enable_debug" = "xno"; then
    GTKUNIQUE_DEBUG_FLAGS="-DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DG_DISABLE_CAST_CHECKS"
  else
    # test x$enable_debug = "xminimum"
    GTKUNIQUE_DEBUG_FLAGS="-DG_DISABLE_CAST_CHECKS"
  fi
fi

# i18n stuff
ALL_LINGUAS=""
AM_GLIB_GNU_GETTEXT

GETTEXT_PACKAGE=gtkunique
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"],
                   [Define the gettext package to be used])

AM_GLIB_DEFINE_LOCALEDIR(GTKUNIQUE_LOCALEDIR)

GTK_DOC_CHECK([1.0])

AC_CONFIG_FILES([
        Makefile
        gtkunique-1.0.pc
        docs/Makefile
        docs/reference/Makefile
        docs/reference/version.xml
	gtkunique/Makefile
        gtkunique/gtkuniqueversion.h
        gtkunique/bacon/Makefile
        gtkunique/dbus/Makefile
        gtkunique/xlibs/Makefile
	tests/Makefile
        po/Makefile.in
])

AC_OUTPUT

echo "configuration:
        backend: $gtkuniquebackend
        debug level: $enable_debug"
