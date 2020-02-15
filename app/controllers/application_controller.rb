class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !@current_user.nil?
  end

  def authorize
    redirect_to '/', notice: "Please Log In or Sign up before continuing" if current_user.nil?
  end
end
