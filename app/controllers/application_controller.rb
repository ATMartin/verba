class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :require_user

  def require_user
    redirect_to login_path, notice: "Please log in." unless signed_in?
  end

  def require_admin
    redirect_to root_path unless signed_in? && admin?
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def signed_in?
    current_user.present?
  end

  def admin?
    current_user.admin == true
  end
end
