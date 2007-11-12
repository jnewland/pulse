require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'
require 'rake/rdoctask'
require 'open-uri'
require 'version'

task :default => :test

Gem::manage_gems

specification = Gem::Specification.new do |s|
  s.name = "pulse"
  s.version = VERSION
  s.author = "Paul Gross"
  s.email = "pgross@gmail.com"
  s.homepage = "http://www.pgrs.net"
  s.summary = "Adds a pulse url to Ruby on Rails."
  s.files = FileList["README", "init.rb", "lib/**/*.rb"].to_a
  s.autorequire = "init"
end

Rake::GemPackageTask.new(specification) do |package|
  package.need_zip = true
  package.need_tar = true
end

desc 'Generate RDoc'
Rake::RDocTask.new do |task|
  task.main = 'README'
  task.title = 'Pulse'
  task.rdoc_dir = 'doc'
  task.options << "--line-numbers" << "--inline-source"
  task.rdoc_files.include('README', 'lib/**/*.rb')
end

desc "Run all tests"
task :test => [:'test:unit', :repackage, :'test:acceptance']

Rake::TestTask.new(:'test:unit') { |t|
  t.libs << "test"
  t.pattern = 'test/unit/**/*_test.rb'
  t.verbose = true
}

Rake::TestTask.new(:'test:acceptance') { |t|
  t.libs << "test"
  t.pattern = 'test/acceptance/**/*_test.rb'
  t.verbose = true
}
