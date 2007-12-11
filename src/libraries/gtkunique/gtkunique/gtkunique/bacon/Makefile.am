libgtkuniqueincludedir = $(includedir)/gtkunique-1.0/gtkunique

INCLUDES = \
	-DG_LOG_DOMAIN=\"GtkUnique\"	\
	-I$(top_srcdir)			\
	$(GTKUNIQUE_CFLAGS)		\
	$(GTKUNIQUE_DEBUG_FLAGS)

LDADD = $(GTKUNIQUE_LIBS)

noinst_LTLIBRARIES = libgtkunique-bacon.la

libgtkunique_bacon_la_SOURCES = 	\
	gtkuniqueapp-bacon.c		\
	gtkuniqueapp-bacon.h		\
	gtkuniquefactory-bacon.c	\
	gtkuniquefactory-bacon.h
