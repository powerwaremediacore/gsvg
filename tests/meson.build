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

test_g_files = ([
		'gsvg-g-test.vala'
	])
tg = executable('gsvg_g_tests', test_g_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)
test ('group-g', tg)



test_circle_files = ([
		'gsvg-circle-test.vala'
	])
tcircle = executable('gsvg_circle_tests', test_circle_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)

test ('circle', tcircle)

test_ellipse_files = ([
		'gsvg-circle-test.vala'
	])
tellipse = executable('gsvg_ellipse_tests', test_ellipse_files,
	vala_args : [],
	dependencies : [ gxml, inc_libh_dep, testdirs_dep, inc_rooth_dep],
	link_with: lib
)

test ('ellipse', tellipse)
