testdirs_dep = declare_dependency (compile_args : [
	'-DTEST_DIR="'+join_paths (meson.source_root (),'test')+'"',
	'-DTEST_SAVE_DIR="'+join_paths (meson.build_root (),'test')+'"',
])

files_tests = ([
		'gsvg-svg-test.vala',
		'gsvg-test.vala'
	])

t = executable('gsvg_basic_tests', files_tests,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)

test ('gsvg_basic_tests', t)

