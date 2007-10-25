require 'test/unit'
require 'open-uri'

class InstallationTest < Test::Unit::TestCase
  
  def test_install_pulse_gem_in_new_rails_project
    clean
    create_new_rails_project
    install_pulse_as_gem
    start_server_and_check_pulse
  end

  def install_pulse_as_gem
    sh "sudo gem install pkg/pulse-0.1.0"    
    sh "echo \"\nrequire 'pulse'\" >> testapp/config/environment.rb"  
  end
  
  def test_install_pulse_in_vendor_of_new_rails_project
    clean
    create_new_rails_project
    install_pulse_in_vendor
    start_server_and_check_pulse
  end
  
  def install_pulse_in_vendor
    sh "tar -C testapp/vendor -xvf pkg/pulse-0.1.0.tgz"
    File.open('testapp/config/environment.rb', 'a') do |f|
      f.puts "\n$LOAD_PATH << File.dirname(__FILE__) + '/../vendor/pulse-0.1.0/lib'"
      f.puts "require 'pulse'"
    end
  end
  
  def clean
    sh "sudo gem uninstall pulse" unless `gem list | grep pulse`.empty?
    system "killall mongrel_rails"
    sh "rm -rf testapp"
  end
  
  def create_new_rails_project
    sh "rails testapp"
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
