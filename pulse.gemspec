Gem::Specification.new do |s|
  s.name = %q{pulse}
  s.version = "0.4.1"
  s.authors = ["Paul Gross", "Jesse Newland"]
  s.date = %q{2008-10-03}
  s.description = s.summary = %q{Adds a pulse action to a Rails app}
  s.email = %q{jnewland@gmail.com}
  s.homepage = %q{http://github.com/jnewland/pulse}

  s.files = [
    "install.rb",
    "init.rb",
    "lib/pulse.rb",
    "lib/pulse_controller.rb",
    "lib/pulse_helper.rb",
    "lib/routes.rb",
    "README.textile"
  ]
  s.require_paths = ["lib"]

  s.add_dependency(%q<rails>)

  s.has_rdoc = false

  s.rubygems_version = %q{1.2.0}
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
end