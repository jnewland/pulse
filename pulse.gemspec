Gem::Specification.new do |s|
  s.name = %q{pulse}
  s.version = "0.4.3"
  s.authors = ["Paul Gross", "Jesse Newland"]
  s.date = %q{2008-10-03}
  s.description = s.summary = %q{Adds a pulse action to a Rails app}
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
