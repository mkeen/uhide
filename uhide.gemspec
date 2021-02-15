Gem::Specification.new do |s|
  s.name             = 'uhide'
  s.version          = '0.0.14'
  s.summary          = "☂️: Personal encryption fit for a spy"
  s.description      = "Allows a regular person to maintain a named list of secrets that's encrypted at rest"
  s.authors          = ["Mike Keen"]
  s.email            = 'mwk@mikekeen.com'
  s.files            = ["lib/uhide.rb", "lib/uhide/main.rb"]
  s.bindir           = 'bin'
  s.executables      = ["uhide"]
  s.homepage         = 'https://github.com/mkeen/uhide'
  s.license          = 'ISC (BSD2/MIT)'
  s.extra_rdoc_files = ['README.md']
  s.add_runtime_dependency 'activesupport', '~> 6.0'
  s.add_runtime_dependency 'colorize'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubygems-tasks'
end
