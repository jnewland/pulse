$LOAD_PATH.unshift 'lib/'

require 'rubygems'
require 'multi_rails_init'

#mock out some rails related stuff

RAILS_ROOT='.'

def require_dependency(foo)
  nil
end

class ApplicationController < ActionController::Base
  helper :all
end

def params_from(method, path)
  ActionController::Routing::Routes.recognize_path(path, :method => method)
end

begin
  require 'spec'
  require 'spec/rails'
rescue LoadError
  gem 'rspec'
  gem 'rspec-rails'
  require 'spec'
  require 'spec/rails'
end

require 'pulse'
