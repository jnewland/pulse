require 'test/unit'
require 'rubygems'
require 'action_controller'

require File.dirname(__FILE__) + '/../../lib/routes'

class RoutesTest < Test::Unit::TestCase
  
  def test_map_connect_adds_route_to_routes
    ActionController::Routing::Routes.draw do |map|
      map.connect 'pulse', :controller => 'pulse', :action => 'pulse'
    end
    
    assert_equal 1, ActionController::Routing::Routes.routes.size
    route_representation = 'ANY    /pulse/                                  {:controller=>"pulse", :action=>"pulse"}'
    assert_equal route_representation, ActionController::Routing::Routes.routes.first.to_s
  end
  
  def test_pulse_adds_route_to_routes
    ActionController::Routing::Routes.draw do |map|
      map.pulse 'heartbeat'
    end
    
    assert_equal 1, ActionController::Routing::Routes.routes.size
    route_representation = 'ANY    /heartbeat/                              {:controller=>"pulse", :action=>"pulse"}'
    assert_equal route_representation, ActionController::Routing::Routes.routes.first.to_s    
  end
end
