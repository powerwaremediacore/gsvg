valadoc = find_program ('valadoc')
outdir = CAMEL_CASE_NAME+'-'+API_VERSION
gtkdoc_outdir = PROJECT_NAME+'-'+API_VERSION
valacapi = run_command ('valac', '--api-version')
driver = '--driver='+valacapi.stdout().strip()
pkgname = '--package-name='+'GXml-'+API_VERSION
pkgversion = '--package-version='+PROJECT_VERSION
vapidirgxml = '--vapidir='+join_paths (meson.current_source_dir (),'gxml')
vapidirvapi = '--vapidir='+join_paths (meson.current_source_dir (),'vapi')
docsdir = join_paths (get_option ('datadir'), 'devhelp','books')

custom_target ('valadocs',
		input : sources,
		output : outdir,
		command : [valadoc,
			driver,
			'--doclet=devhelp',
			'--force',
			pkgname,
			pkgversion,
			'--pkg=glib-2.0',
			'--pkg=gio-2.0',
			'--pkg=libxml-2.0',
			'--pkg=gee-0.8',
			'--pkg=gxml-0.16',
			'--directory=@OUTDIR@',
			valasources],
		install : true,
		install_dir : docsdir)
