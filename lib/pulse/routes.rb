module Pulse
  module Routes
    def pulse(path = nil)
      path ||= "/pulse"
      if Rails::VERSION::MAJOR == 2
        connect path, :controller => 'pulse', :action => 'pulse'
      else
        get path => 'pulse#pulse'
      end
    end
  end
end

if Rails::VERSION::MAJOR > 2
  ActionDispatch::Routing::Mapper.send :include, Pulse::Routes
else # fallback to 2.x stuff
  ActionController::Routing::RouteSet::Mapper.send :include, Pulse::Routes
end
