class PulseController < ActionController::Base
  session :off

  def pulse
    render :text => "OK"
  end
  
  def logger
    nil
  end
end
