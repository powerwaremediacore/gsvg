lib_LTLIBRARIES = libgsvg-@API_VERSION@.la

libgsvg_@API_VERSION@_la_SOURCES = \
	gsvg-object.vala \
	gsvg-dom-interfaces.vala \
	gsvg-svg.vala \
	css-interfaces.vala \
	gsvg-dom-interfaces-basic-shapes.vala \
	gsvg-dom-interfaces-coord.vala \
	gsvg-dom-interfaces-filter.vala \
	gsvg-dom-interfaces-fonts.vala \
	gsvg-dom-interfaces-interactivity.vala \
	gsvg-dom-interfaces-meta-ext.vala \
	gsvg-dom-interfaces-painting.vala \
	gsvg-dom-interfaces-path.vala \
	gsvg-dom-interfaces-struct.vala \
	gsvg-dom-interfaces-text.vala \
	gsvg-dom-interfaces.vala \
	$(NULL)

libgsvg_@API_VERSION@_la_CFLAGS = \
	$(GSVG_CFLAGS) \
	$(WARN_CFLAGS) \
	$(NULL)

libgsvg_@API_VERSION@_la_LIBADD = \
	$(GSVG_LIBS) \
	$(NULL)

libgsvg_@API_VERSION@_la_LDFLAGS = \
	$(WARN_LDFLAGS) \
	$(NULL)

libgsvg_@API_VERSION@_la_VALAFLAGS = \
	--thread \
	--target-glib=2.44 \
	--pkg glib-2.0 \
	$(NULL)

-include $(top_srcdir)/git.mk

EXTRA_DIST= \
	libgsvg_@API_VERSION@_la_vala.stamp
