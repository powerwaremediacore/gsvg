include $(top_srcdir)/valalib.mk

VALA_TARGET = libgsvg-@API_VERSION@.la

lib_LTLIBRARIES = $(VALA_TARGET)

VALASOURCES = \
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
	gsvg-object.vala \
	gsvg-svg.vala \
	gsvg-basic-shapes.vala \
	gsvg-property-length.vala \
	$(NULL)

libgsvg_@API_VERSION@_la_SOURCES = \
	$(VALA_CSOURCES) \
	$(NULL)

libgsvg_@API_VERSION@_la_CFLAGS = \
	$(GSVG_CFLAGS) \
	$(NULL)

libgsvg_@API_VERSION@_la_LIBADD = \
	$(GSVG_LIBS) \
	$(NULL)

libgsvg_@API_VERSION@_la_LDFLAGS = \
	$(NULL)

VALAFLAGS += \
	--thread \
	--target-glib=2.44 \
	--pkg glib-2.0 \
	--pkg gxml-0.14 \
	$(NULL)

VALA_CHEADER = gsvg.h
VALA_INCLUDEDIR = GSvg-@API_VERSION@
VALA_VAPI = gsvg-@API_VERSION@.vapi
VALA_DEPS = gsvg-@API_VERSION@.deps

DISTCLEANFILES = $(VALA_DEPS)

-include $(top_srcdir)/git.mk


if DEBUG
VALAFLAGS+=\
	-D DEBUG \
	$(NULL)
endif

if HAVE_INTROSPECTION

include $(top_srcdir)/valalib_introspection.mk

INTROSPECTION_GIRS = GSvg-@API_VERSION@.gir
INTROSPECTION_TYPELIBS = GSvg-@API_VERSION@.typelib

endif

