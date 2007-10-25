require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'open-uri'

task :default => :test

Gem::manage_gems

specification = Gem::Specification.new do |s|
  s.name = "pulse"
  s.version = "0.1.0"
  s.author = "Paul Gross"
  s.email = "pgross@gmail.com"
  s.homepage = "http://www.pgrs.net"
  s.summary = "Adds a pulse url to Ruby on Rails."
  s.files = FileList["lib/**/*.rb"].to_a
  s.require_path = "lib"
  s.autorequire = "pulse"
end

Rake::GemPackageTask.new(specification) do |package|
  package.need_zip = true
  package.need_tar = true
end

desc "Run all tests"
task :test => [:repackage, :'test:acceptance']

Rake::TestTask.new(:'test:acceptance') { |t|
  t.libs << "test"
  t.pattern = 'test/acceptance/**/*_test.rb'
  t.verbose = true
}
