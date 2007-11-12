module Pulse
  module Routes
    def pulse(path)
      connect path, :controller => 'pulse', :action => 'pulse'
    end
  end
end

ActionController::Routing::RouteSet::Mapper.send :include, Pulse::Routes
