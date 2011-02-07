Gem::Specification.new do |s|
  s.name = %q{rails-pulse}
  s.version = "0.4.5"
  s.authors = ["Paul Gross", "Jesse Newland", "Josh Goebel", "Will Farrington"]
  s.date = %q{2011-02-07}
  s.description = s.summary = %q{Adds a pulse URL that pings the DB to a Rails app.}
  s.description += "\nThis is an improved version of the `pulse` gem."
  s.email = %q{jnewland@gmail.com}
  s.homepage = %q{http://github.com/jnewland/pulse}

  s.files = [
    "init.rb",
    "lib/pulse.rb",
    "lib/pulse_controller.rb",
    "lib/pulse_helper.rb",
    "lib/routes.rb",
    "README.textile"
  ]
  s.require_paths = ["lib"]

  s.has_rdoc = false

  s.rubygems_version = %q{1.2.0}
end
