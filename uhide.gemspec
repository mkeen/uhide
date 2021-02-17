Gem::Specification.new do |s|
  s.name             = 'uhide'
  s.version          = '0.0.34'
  s.description      = "☂️ Personal encryption fit for a spy"
  s.summary          = "Powered by emoji technology, this encrypted text store is a cut above."
  s.authors          = ["Mike Keen"]
  s.email            = 'mwk@mikekeen.com'
  s.files            = ["lib/uhide.rb", "lib/uhide/main.rb"]
  s.executables      = ["uhide"]
  s.homepage         = 'https://github.com/mkeen/uhide'
  s.license          = 'ISC (BSD2/MIT)'
  s.extra_rdoc_files = ['README.md']
  s.add_runtime_dependency 'activesupport', '~> 6.0'
  s.add_runtime_dependency 'colorize', '0.8.1'
  s.add_development_dependency 'rake', '13.0.3'
  s.add_development_dependency 'rubygems-tasks', '0.2.5'
end
