require 'rake'

Gem::Specification.new do |s|
  s.name = "ruby-geometry"
  s.version = "0.0.2"
  s.author = "Daniel Vartanov"
  s.email = "daniel.vartanov@gmail.com"
  s.homepage = "http://github.com/DanielVartanov/ruby-geometry"
  s.platform = Gem::Platform::RUBY
  s.summary = "Implementation of basic 2D geometry algorithms in Ruby"
  s.files = FileList["{lib}/**/*"].to_a
  s.require_path = "lib"
  s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = false
end
