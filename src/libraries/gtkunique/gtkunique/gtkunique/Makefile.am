NULL =

SUBDIRS = $(gtkuniquebackend)
DIST_SUBDIRS = xlibs bacon dbus

target = $(gtkuniquebackend)

INCLUDES = \
	-DG_LOG_DOMAIN=\"GtkUnique\"		\
	-DPREFIX=\""$(prefix)"\"		\
	-I$(top_srcdir)				\
	$(GTKUNIQUE_CFLAGS)			\
	$(GTKUNIQUE_DEBUG_FLAGS)		\
	$(DISABLE_DEPRECATED_CFLAGS)		\
	$(NULL)

LDADD = \
	-version-info $(LT_VERSION_INFO)	\
	-export-dynamic				\
	-rpath $(libdir)			\
	$(NULL)

gtkunique_headers = 		\
	gtkuniqueapp.h 		\
	$(NULL)

gtkunique_sources = 		\
	gtkuniqueapp.c 		\
	gtkuniqueappobject.c	\
	gtkuniqueappobject.h	\
	gtkuniqueenumtypes.c	\
	gtkuniqueinternals.h 	\
	gtkuniquemarshal.c	\
	$(NULL)

BUILT_SOURCES =			\
	gtkuniqueenumtypes.h	\
	gtkuniqueenumtypes.c	\
	gtkuniquemarshal.h	\
	gtkuniquemarshal.c	\
	$(NULL)

gtkuniquedir = $(includedir)/gtkunique-1.0/gtkunique
gtkunique_HEADERS = \
	$(gtkunique_headers) \
	gtkuniqueenumtypes.h \
	gtkuniqueversion.h \
	gtkunique.h

if HAVE_DBUS
libgtkunique_dbus_1_0_la_SOURCES = $(gtkunique_sources)
libgtkunique_dbus_1_0_la_LIBADD = $(GTKUNIQUE_LIBS) $(DBUS_LIBS) dbus/libgtkunique-dbus.la
libgtkunique_dbus_1_0_la_LDFLAGS = $(LDADD)
endif

libgtkunique_xlibs_1_0_la_SOURCES = $(gtkunique_sources)
libgtkunique_xlibs_1_0_la_LIBADD = $(GTKUNIQUE_LIBS) xlibs/libgtkunique-xlibs.la
libgtkunique_xlibs_1_0_la_LDFLAGS = $(LDADD)

libgtkunique_bacon_1_0_la_SOURCES = $(gtkunique_sources)
libgtkunique_bacon_1_0_la_LIBADD = $(GTKUNIQUE_LIBS) bacon/libgtkunique-bacon.la
libgtkunique_bacon_1_0_la_LDFLAGS = $(LDADD)

lib_LTLIBRARIES = $(gtkuniquebackendlib)

EXTRA_LTLIBRARIES = libgtkunique-xlibs-1.0.la libgtkunique-bacon-1.0.la

if HAVE_DBUS
EXTRA_LTLIBRARIES += libgtkunique-dbus-1.0.la
endif

gtkuniqueenumtypes.h: stamp-gtkuniqueenumtypes.h
	@true
stamp-gtkuniqueenumtypes.h: $(gtkunique_headers) Makefile
	( cd $(srcdir) && $(GLIB_MKENUMS) \
		--fhead "#ifndef __GTK_UNIQUE_ENUM_TYPES_H__\n" \
		--fhead "#define __GTK_UNIQUE_ENUM_TYPES_H__\n\n" \
		--fhead "#include <glib-object.h>\n\n" \
		--fhead "G_BEGIN_DECLS\n\n" \
		--fprod "/* enumerations from @filename@ */\n" \
		--vhead "GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define GTK_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n\n" \
		--ftail "G_END_DECLS\n\n#endif /* __GTK_UNIQUE_ENUM_TYPES_H__ */" \
	$(gtkunique_headers) ) >> xgen-geth \
	&& (cmp -s xgen-geth gtkuniqueenumtypes.h || cp xgen-geth gtkuniqueenumtypes.h ) \
	&& rm -f xgen-geth \
	&& echo timestamp > $(@F)

gtkuniqueenumtypes.c: gtkuniqueenumtypes.h Makefile
	( cd $(srcdir) && $(GLIB_MKENUMS) \
		--fhead "#include <glib-object.h>\n" \
		--fhead "#include \"gtkuniqueenumtypes.h\"\n" \
		--fprod "\n/* enumerations from \"@filename@\" */" \
		--fprod "\n#include \"@filename@\"" \
		--vhead "static const G@Type@Value _@enum_name@_values[] = {" \
		--vprod "  { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
		--vtail "  { 0, NULL, NULL }\n};\n\n" \
		--vtail "GType\n@enum_name@_get_type (void)\n{\n" \
		--vtail "  static GType type = 0;\n\n" \
		--vtail "  if (!type)\n" \
		--vtail "    type = g_@type@_register_static (\"@EnumName@\", _@enum_name@_values);\n\n" \
		--vtail "  return type;\n}\n\n" \
	$(gtkunique_headers) ) >> xgen-getc \
	&& cp xgen-getc gtkuniqueenumtypes.c \
	&& rm -f xgen-getc

gtkuniquemarshal.h: stamp-gtkuniquemarshal.h
	@true
stamp-gtkuniquemarshal.h: gtkuniquemarshal.list Makefile
	$(GLIB_GENMARSHAL) \
		--prefix=gtkunique_marshal \
		--header \
	$(srcdir)/gtkuniquemarshal.list >> xgen-umh \
	&& (cmp -s xgen-umh gtkuniquemarshal.h || cp xgen-umh gtkuniquemarshal.h ) \
	&& rm -f xgen-umh \
	&& echo timestamp > $(@F)

gtkuniquemarshal.c: gtkuniquemarshal.list Makefile
	( echo "#include \"gtkuniquemarshal.h\"" ; \
	$(GLIB_GENMARSHAL) \
	  	--prefix=gtkunique_marshal \
		--body \
	$(srcdir)/gtkuniquemarshal.list ) >> xgen-umc \
	&& cp xgen-umc gtkuniquemarshal.c \
	&& rm -f xgen-umc

CLEANFILES = stamp-gtkuniquemarshal.h stamp-gtkuniqueenumtypes.h
DISTCLEANFILES = 		\
	gtkuniqueenumtypes.h	\
	gtkuniqueenumtypes.c	\
	gtkuniquemarshal.h 	\
	gtkuniquemarshal.c 	\
	gtkuniqueversion.h	\
	$(NULL)

EXTRA_DIST = gtkuniquemarshal.list gtkuniqueversion.h.in
