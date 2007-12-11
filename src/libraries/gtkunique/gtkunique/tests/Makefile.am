INCLUDES = \
	-DG_LOG_DOMAIN=\"Test-GtkUnique\" 	\
	-I$(top_srcdir) 			\
	-I$(top_builddir)/gtkunique 		\
	$(GTKUNIQUE_CFLAGS) 			\
	$(GTKUNIQUE_DEBUG_FLAGS)

DEPS = $(top_builddir)/gtkunique/$(gtkuniquebackendlib)

LDADD = $(top_builddir)/gtkunique/$(gtkuniquebackendlib)

noinst_PROGRAMS = 	\
	test-subclass 	\
	test-unique

test_subclass_DEPENDENCIES = $(DEPS)
test_unique_DEPENDENCIES = $(DEPS)

test_subclass_LDADD = $(LDADD)
test_unique_LDADD = $(LDADD)

test_subclass_SOURCES = test-subclass.c
test_unique_SOURCES = test-unique.c
