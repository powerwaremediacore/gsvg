vapidir = join_paths (get_option('datadir'),'vala','vapi')
GIR_NAME= VERSIONED_CAMEL_CASE_NAME+'.gir'
TYPELIB_NAME= VERSIONED_CAMEL_CASE_NAME+'.typelib'
VAPI_NAME = VERSIONED_PROJECT_NAME+'.vapi'

conf = configuration_data()
conf.set('prefix', get_option('prefix'))
conf.set('exec_prefix', get_option('prefix'))
conf.set('libdir', join_paths (get_option ('prefix'),get_option ('libdir')))
conf.set('includedir', join_paths (get_option ('includedir'), VERSIONED_PROJECT_NAME))
conf.set('VALADEPS', VALADEPS)
conf.set('PROJECT_NAME', PROJECT_NAME)
conf.set('PCDEPS', PCDEPS)
conf.set('PROJECT_VERSION', PROJECT_VERSION)
conf.set('API_VERSION', API_VERSION)

configure_file(input : 'gsvg.deps.in',
	output : 'gsvg-@0@.deps'.format(API_VERSION),
	configuration : conf,
	install : true,
	install_dir : vapidir)

nsinfo = configure_file(input : 'namespace-info.vala.in',
	output : 'namespace-info.vala',
	configuration : conf)
namespaceinfo_dep = declare_dependency (sources : nsinfo)

confh = configuration_data ()
confh.set_quoted('PACKAGE_LOCALE_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'locale'))
confh.set_quoted('GETTEXT_PACKAGE', PROJECT_NAME)
configure_file(output : 'config.h',
	configuration : confh)

valasources = files ([
	'css-classes.vala',
	'css-interfaces.vala',
	'gsvg-coord.vala',
	'gsvg-basic-shapes.vala',
	'gsvg-dom-interfaces-basic-shapes.vala',
	'gsvg-dom-interfaces-coord.vala',
	'gsvg-dom-interfaces-filter.vala',
	'gsvg-dom-interfaces-fonts.vala',
	'gsvg-dom-interfaces-interactivity.vala',
	'gsvg-dom-interfaces-meta-ext.vala',
	'gsvg-dom-interfaces-painting.vala',
	'gsvg-dom-interfaces-path.vala',
	'gsvg-dom-interfaces-struct.vala',
	'gsvg-dom-interfaces-text.vala',
	'gsvg-dom-interfaces.vala',
	'gsvg-number.vala',
	'gsvg-object.vala',
	'gsvg-property-length.vala',
	'gsvg-svg.vala',
	'gsvg-string.vala',
	'gsvg-text.vala'
])

sources = files ([
])

inc_libh = include_directories ('.')
inc_libh_dep = declare_dependency (include_directories : inc_libh)

lib = library(VERSIONED_PROJECT_NAME,
	valasources+sources,
	version : PROJECT_VERSION,
	vala_header : PROJECT_NAME+'.h',
	vala_vapi : VAPI_NAME,
	vala_gir : GIR_NAME,
	dependencies : [namespaceinfo_dep, m_dep, gxml],
	install : true,
	install_dir : [
		get_option('libdir'),
		join_paths (get_option('includedir'),VERSIONED_PROJECT_NAME),
		vapidir,
		true
	])

g_ir_compiler = find_program('g-ir-compiler')
custom_target('typelib',
	command: [
		g_ir_compiler,
		'--shared-library', 'lib'+PROJECT_NAME+'-@0@.so'.format (API_VERSION),
		'--output', '@OUTPUT@',
		join_paths(meson.current_build_dir(), GIR_NAME)
	],
	output: TYPELIB_NAME,
	depends: lib,
	install: true,
	install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))

