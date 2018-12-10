class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_session = Session.find_by(session_token: session[:session_token])
    @current_user = current_session.user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!(session[:session_token])
  end

  def logout
    current_user.delete_session!(session[:session_token])
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in

  end

end
