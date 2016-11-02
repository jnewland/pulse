require 'ostruct'
class PulseController < ActionController::Base
  session :off unless Rails::VERSION::STRING >= "2.3"

  # The pulse action. Runs <tt>select 1</tt> on the DB. If a sane result is
  # returned, 'OK' is displayed and a 200 response code is returned. If not,
  # 'ERROR' is returned along with a 500 response code.
  def pulse
    adapter = ActiveRecord::Base::connection_pool.spec.config[:adapter]

    health_method = "#{adapter}_healthy?"

    # Need to include all methods in respond_to? because Ruby 2.0 returns false
    # even for protected methods.
    activerecord_okay = if respond_to?(health_method, true)
                          send(health_method)
                        else
                          raise "Don't know how to check #{adapter}... please to fix?"
                        end

    if activerecord_okay
      render response_for_rails_version(Rails::VERSION::STRING, okay_response)
    else
      render response_for_rails_version(Rails::VERSION::STRING, error_response).
        merge(:status => :internal_server_error)
    end
  end

  protected 

  def logger
    OpenStruct.new
  end

  def sqlite3_healthy?
    select_one_count == 1
  end

  def mysql_healthy?
    select_one_from_dual_num_rows == 1
  end

  def mysql2_healthy?
    select_one_from_dual_count == 1
  end

  def postgresql_healthy?
    select_one_count == 1
  end
  
  alias_method :postgis_healthy?, :postgresql_healthy?

  def select_one_count
    count = begin
              ActiveRecord::Base.connection.execute("select 1").count
            rescue
              0
            end
  end

  def select_one_from_dual_count
    begin
      ActiveRecord::Base.connection.execute("select 1 from dual").count
    rescue
      0
    end
  end

  def select_one_from_dual_num_rows
    begin
      ActiveRecord::Base.connection.execute("select 1 from dual").num_rows
    rescue
      0
    end
  end

  def okay_response
    "<html><body>OK  #{Time.now.utc.to_s(:db)}</body></html>"
  end

  def error_response
    '<html><body>ERROR</body></html>'
  end

  def response_for_rails_version(rails_version_string, response)
    if rails_version_string >= "4.1"
      { :html => response.html_safe }
    else
      { :text => response }
    end
  end
end
