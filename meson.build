project('gsvg', [ 'vala', 'c'], version : '0.3.0')

PROJECT_NAME = meson.project_name()
API_VERSION = '0'
PROJECT_VERSION = meson.project_version()
VERSIONED_PROJECT_NAME = PROJECT_NAME+'-'+API_VERSION
CAMEL_CASE_NAME = 'GSvg'
VERSIONED_CAMEL_CASE_NAME = CAMEL_CASE_NAME +'-'+ API_VERSION

gxml = dependency('gxml-0.16', version:'>=0.15.3')

VALADEPS = 'gxml-0.16'
PCDEPS = 'gxml-0.16'

inc_rooth = include_directories ('.')
inc_rooth_dep = declare_dependency (include_directories : inc_rooth)

#subdir('po')
subdir('src')
#subdir('data')
#subdir('docs')
subdir('tests')
