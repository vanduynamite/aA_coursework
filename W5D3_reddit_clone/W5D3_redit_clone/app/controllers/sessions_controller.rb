

class SessionsController < ApplicationController
  before_action :ensure_not_logged_in, except: :destroy

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      log_in(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

end
