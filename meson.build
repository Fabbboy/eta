project(
  'eta',
  'c',
  meson_version : '>= 1.3.0',
  version : '0.1',
  default_options : ['warning_level=3', 'c_std=c99']
)

muc_dep = dependency('muc', fallback : ['muc', 'muc_dep'])

sources = [
  'eta/main.c'
]

eta_exe = executable(
  'eta',
  sources,
  dependencies : [muc_dep],
  install : true
)