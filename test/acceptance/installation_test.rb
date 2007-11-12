require File.dirname(__FILE__) + '/../../version'
require 'test/unit'
require 'open-uri'

class InstallationTest < Test::Unit::TestCase
  
  def test_install_pulse_as_plugin
    clean
    create_new_rails_project 
    install_pulse_in_plugins
    add_route
    start_server_and_check_pulse
  end
  
  def clean
    sh "sudo gem uninstall pulse" unless `gem list | grep pulse`.empty?
    system "killall mongrel_rails"
    sh "rm -rf testapp"
  end
  
  def create_new_rails_project
    sh "rails testapp"
  end
  
  def install_pulse_in_plugins
    sh "tar -C testapp/vendor/plugins -xvf pkg/pulse-#{VERSION}.tgz"
  end
  
  def add_route
    route_contents = File.read('testapp/config/routes.rb')
    route_contents = route_contents.sub(/^end$/, "  map.pulse 'pulse'\nend")
    File.open('testapp/config/routes.rb', 'w') {|f| f << route_contents }
  end
  
  def start_server_and_check_pulse
    sh "cd testapp && ruby script/server -d"    
    sleep 1
    assert_equal "OK", open("http://localhost:3000/pulse").read
  end
  
  def sh(cmd)
    system cmd || raise
  end
end
