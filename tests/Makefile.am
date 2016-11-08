include $(top_srcdir)/vala_tester.mk

VALA_TARGET=gsvg_test

noinst_PROGRAMS = $(VALA_TARGET)

VALASOURCES = \
	tests-config.vala \
	gsvg-test.vala \
	gsvg-svg-test.vala \
	$(NULL)

gsvg_test_SOURCES = $(VALA_CSOURCES)

VALAFLAGS += \
	--vapidir=$(VAPIDIR) \
	--vapidir=$(top_builddir)/src \
	--pkg gxml-0.14 \
	--pkg gsvg-@API_VERSION@ \
	-g \
	$(NULL)


gsvg_test_CFLAGS = \
	-g \
	$(GSVG_CFLAGS) \
	-I$(top_builddir)/src \
	-I$(top_builddir) \
	$(NULL)

gsvg_test_LDADD = \
	$(GSVG_LIBS) \
	$(top_builddir)/src/libgsvg-@API_VERSION@.la


gsvg_test_LDFLAGS = $(AM_LDFLAGS)

EXTRA_DIST += \
	files \
	$(NULL)

distclean-local:
	rm -Rf $(builddir)/testing


DISTCLEANFILES += \
	test-config.vala \
	$(NULL)



