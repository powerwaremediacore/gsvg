lib_LTLIBRARIES = libgsvg-@API_VERSION@.la

libgsvg_@API_VERSION@_la_SOURCES = \
	gsvg-object.vala \
	gsvg-dom-interfaces.vala \
	gsvg-svg.vala \
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
