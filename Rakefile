require 'rake/dsl_definition'
require 'rake'
require 'rake/testtask'
require 'bundler/gem_tasks'

task :default => :test

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.verbose = true
  t.test_files = FileList['test/*_test.rb']
end
