class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :ensure_logged_in

  def current_user
    return nil unless session[:session_token]
    @user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    session[:session_token] = current_user.reset_session_token!
    current_user.session_token = nil
  end

  def ensure_logged_in
    unless logged_in?
      redirect_to new_session_url
    end
  end
end
