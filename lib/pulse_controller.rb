class PulseController < ActionController::Base
  session :off

  def pulse
    render :text => "<html><body>OK</body></html>"
  end
  
  def logger
    nil
  end
end
