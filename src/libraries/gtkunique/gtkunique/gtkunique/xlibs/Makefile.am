libgtkuniqueincludedir = $(includedir)/gtkunique-1.0/gtkunique

INCLUDES = \
	-DG_LOG_DOMAIN=\"GtkUnique\"	\
	-I$(top_srcdir)			\
	$(GTKUNIQUE_CFLAGS)		\
	$(GTKUNIQUE_DEBUG_FLAGS)

LDADD = $(GTKUNIQUE_LIBS)

noinst_LTLIBRARIES = libgtkunique-xlibs.la

libgtkunique_xlibs_la_SOURCES = \
	gtkuniqueutils-xlibs.h	\
	gtkuniqueapp-xlibs.h	\
	gtkuniqueapp-xlibs.c
