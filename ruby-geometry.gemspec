Gem::Specification.new do |s|
  s.name = "ruby-geometry"
  s.version = "0.0.4"
  s.author = ["Daniel Vartanov"]
  s.email = ["dan@vartanov.net"]
  s.homepage = "http://github.com/DanielVartanov/ruby-geometry"
  s.summary = "Implementation of basic 2D geometry algorithms in Ruby"
  s.has_rdoc = false
  s.license = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport'
  s.add_dependency 'memoist'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
