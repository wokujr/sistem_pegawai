class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :authorize_admin
  def current_user
    @current_user ||= User.find(session[:user_id])  if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def authorize_admin
    redirect_to root_path, alert: "You Don't have permission to do that" unless current_user.admin?
  end

end


