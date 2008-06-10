require File.dirname(__FILE__) + '/../../version'
require 'test/unit'
require 'open-uri'

class InstallationTest < Test::Unit::TestCase

  def setup
    clean
  end

  def teardown
    clean
  end
  
  def test_install_pulse_as_plugin
    create_new_rails_project 
    install_pulse_in_plugins
    add_route
    start_server_and_check_pulse
  end
  
  def clean
    system "cd testapp && mongrel_rails stop --pid tmp/pids/mongrel.pid"
    system "killall mongrel_rails"
    sh "rm -rf testapp"
  end
  
  def create_new_rails_project
    sh "rails testapp"
  end
  
  def install_pulse_in_plugins
    sh "tar -C testapp/vendor/plugins -xvf pkg/pulse-#{Version::VERSION}.tgz"
    sh "mv testapp/vendor/plugins/pulse-#{Version::VERSION} testapp/vendor/plugins/pulse"
  end
  
  def add_route
    route_contents = File.read('testapp/config/routes.rb')
    route_contents = route_contents.sub(/^end$/, "  map.pulse 'pulse'\nend")
    File.open('testapp/config/routes.rb', 'w') {|f| f << route_contents }
  end
  
  def start_server_and_check_pulse
    sh "cd testapp && mongrel_rails start -d --pid tmp/pids/mongrel.pid"
    sleep 1
    assert_equal "<html><body>OK</body></html>", open("http://localhost:3000/pulse").read
  end
  
  def sh(cmd)
    system cmd || raise
  end
end
