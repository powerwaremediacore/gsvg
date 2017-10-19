deconf = configuration_data()
deconf.set('PROJECT_NAME', meson.project_name ())
deconf.set('VERSION', meson.project_version ())
deconf.set('API_VERSION', API_VERSION)
deconf.set('includedir', join_paths (get_option ('includedir'), VERSIONED_PROJECT_NAME))

configure_file(input : 'gsvg.pc.in',
	output : 'gsvg-@0@.pc'.format(API_VERSION),
	configuration : conf,
	install : true,
	install_dir : join_paths(get_option('libdir'), 'pkgconfig'))
