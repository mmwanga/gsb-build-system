SUBDIRS = po gtkunique tests docs

AUTOMAKE_OPTIONS = 1.7

backend=@gtkuniquebackend@

gtkunique-$(backend)-1.0.pc: gtkunique-1.0.pc
	rm -f gtkunique-$(backend)-1.0.pc && \
	cp gtkunique-1.0.pc gtkunique-$(backend)-1.0.pc

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = gtkunique-1.0.pc gtkunique-$(backend)-1.0.pc

EXTRA_DIST = gtkunique-1.0.pc.in NEWS TODO

DISTCHECK_CONFIGURE_FLAGS = --enable-gtk-doc --disable-rebuilds

DISTCLEANFILES = gtkunique-$(backend)-1.0.pc

release:
	@rm -rf .deps */.deps
	$(MAKE) distcheck

snapshot:
	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
