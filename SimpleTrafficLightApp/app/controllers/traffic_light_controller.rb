class TrafficLightController < ActionController::Base
  def showtrafficlight
    render 'showtrafficlight'
  end

  def changecolor
    session[:color] = params[:newcolor]
    redirect_to '/showtrafficlight'
  end
end
