class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user ? true : false
  end

  def require_login
    unless logged_in?
      redirect_to root_path, notice: "Please log in."
    end
  end

  helper_method :current_user,
                :logged_in?,
                :require_login
end