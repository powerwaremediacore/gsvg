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
test ('basic', t)

test_rect_files = ([
		'gsvg-rect-test.vala'
	])
trect = executable('gsvg_rect_tests', test_rect_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)
test ('rect', trect)


test_polylines_files = ([
		'gsvg-polyline-test.vala'
	])
tpolyl = executable('gsvg_polyline_tests', test_polylines_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)
test ('polyline', tpolyl)

test_text_files = ([
		'gsvg-text-test.vala'
	])
ttext = executable('gsvg_text_tests', test_text_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)
test ('text', ttext)

