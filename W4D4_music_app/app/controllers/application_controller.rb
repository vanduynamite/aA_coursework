

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  private

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil if session.nil? || session[:session_token].nil?
    current_session = Session.find_by(token: session[:session_token])
    current_session.nil? ? nil : current_session.user
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def ensure_not_logged_in
    redirect_to bands_url if logged_in?
  end

  def ensure_owner
    record = self.class.find_by(id: params[:id])

    unless current_user == record.user
      flash[:errors] = ["You do not have permission to modify this record"]
      redirect_to bands_url
    end
  end

  def log_out!
    Session.find_by(token: session[:session_token]).destroy
    session[:session_token] = nil
  end

end
