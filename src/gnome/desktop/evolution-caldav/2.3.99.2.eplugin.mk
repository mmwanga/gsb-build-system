%.eplug: %.eplug.in
	sed -e 's|\@PLUGINDIR\@|$(eplugindir)|;s|\@LOCALEDIR\@|$(localedir)|;s|\@GETTEXT_PACKAGE\@|$(GETTEXT_PACKAGE)|' $< > $@
