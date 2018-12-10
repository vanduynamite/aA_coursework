# new_session GET    /session/new(.:format)       sessions#new
# session     POST   /session(.:format)           sessions#create
# session     DELETE /session(.:format)           sessions#destroy


class SessionsController < ApplicationController
  before_action :ensure_not_logged_in, only: [:new, :create]

  def new
    render :index
  end

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])

    unless user.nil?
      log_in!(user)
      redirect_to bands_url
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
