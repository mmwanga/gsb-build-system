AUTOMAKE_OPTIONS=1.7

DOC_MODULE=gtkunique
DOC_MAIN_SGML_FILE=gtkunique-docs.sgml
DOC_SOURCE_DIR=../../gtkunique

SCANGOBJ_OPTIONS=--type-init-func="gtk_type_init(0)"
SCAN_OPTIONS=
MKDB_OPTIONS=--sgml-mode --output-format=xml
MKTMPL_OPTIONS=
FIXXREF_OPTIONS=--extra-dir=$(datadir)/gtk-doc/html

HFILE_GLOB=$(top_srcdir)/gtkunique/*.h
CFILE_GLOB=$(top_srcdir)/gtkunique/*.c

IGNORE_HFILES= \
	gtkunique.h \
	gtkuniqueappobject.h \
	gtkuniqueinternals.h \
	gtkuniquemarshal.h \
	gtkuniqueenumtypes.h \
	stamp-gtkuniquemarshal.h \
	stamp-gtkuniqueenumtypes.h \
	bacon \
	dbus \
	xlibs

HTML_IMAGES=

content_files= \
	backend-bacon.sgml \
	backend-dbus.sgml \
	backend-xlibs.sgml \
	version.xml

expand_content_files = \
	backend-bacon.sgml \
	backend-dbus.sgml \
	backend-xlibs.sgml

INCLUDES=-I$(top_srcdir) -I$(top_builddir) $(GTKUNIQUE_CFLAGS)
GTKDOC_LIBS=$(top_builddir)/gtkunique/$(gtkuniquebackendlib)

include $(top_srcdir)/gtk-doc.make

EXTRA_DIST += version.xml.in
