libgtkuniqueincludedir = $(includedir)/gtkunique-1.0/gtkunique

INCLUDES = \
	-DG_LOG_DOMAIN=\"GtkUnique\"	\
	-I$(top_srcdir)			\
	$(GTKUNIQUE_CFLAGS)		\
	$(GTKUNIQUE_DEBUG_FLAGS)	\
	$(DBUS_CFLAGS)

LDADD = $(GTKUNIQUE_LIBS) $(DBUS_LIBS)

noinst_LTLIBRARIES = libgtkunique-dbus.la

BUILT_SOURCES =	\
	gtkuniqueapp-bindings.h	\
	gtkuniqueapp-glue.h

libgtkunique_dbus_la_SOURCES = 	\
	gtkuniquefactory-dbus.h	\
	gtkuniquefactory-dbus.c	\
	gtkuniqueapp-dbus.h	\
	gtkuniqueapp-dbus.c	\
	gtkuniqueapp-bindings.h	\
	gtkuniqueapp-glue.h

gtkuniqueapp-bindings.h: gtkuniqueapp-dbus.xml $(DBUS_BINDING_TOOL)
	$(DBUS_BINDING_TOOL) \
		--mode=glib-server \
		--output=$@ \
		--prefix=gtkuniqueapp \
	gtkuniqueapp-dbus.xml
gtkuniqueapp-glue.h: gtkuniqueapp-dbus.xml $(DBUS_BINDING_TOOL)
	$(DBUS_BINDING_TOOL) \
		--mode=glib-client \
		--output=$@ \
		--prefix=gtkuniqueapp \
	gtkuniqueapp-dbus.xml

EXTRA_DIST = gtkuniqueapp-dbus.xml
