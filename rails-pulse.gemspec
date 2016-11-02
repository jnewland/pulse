Gem::Specification.new do |s|
  s.name = %q{rails-pulse}
  s.version = "0.5.1"
  s.authors = ["Paul Gross", "Jesse Newland", "Josh Goebel", "Will Farrington", "Josh Nichols"]
  s.date = %q{2013-04-01}
  s.description = s.summary = %q{Adds a pulse URL that pings the DB to a Rails app.}
  s.description += "\nThis is the maintained version of the `pulse` gem."
  s.email = %q{jnewland@gmail.com}
  s.homepage = %q{http://github.com/jnewland/pulse}

  # init.rb does not need to be in our gem
  s.files = ["README.textile"] + Dir.glob("lib/**/*.rb")
    
  s.test_files = `git ls-files -- spec/*`.split("\n")
  
  s.extra_rdoc_files = [ "README.textile" ]
  s.require_paths = ["lib"]

  s.has_rdoc = false
  
  s.add_runtime_dependency "rails"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "multi_rails"

  s.rubygems_version = %q{1.2.0}
end
