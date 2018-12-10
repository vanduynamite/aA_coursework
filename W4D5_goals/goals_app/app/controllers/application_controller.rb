class ApplicationController < ActionController::Base

  #CELLL

  private

  def current_user
    user = User.find_by(session_token: session[:session_token])
    user.nil? ? nil : user
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

end
