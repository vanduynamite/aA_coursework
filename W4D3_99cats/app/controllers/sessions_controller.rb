
class SessionsController < ApplicationController
  # before_action :redirect_if_logged

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password])

    if user
      log_in!(user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid Username or Password"]
      redirect_to new_session_url
    end

  end

  def destroy
    log_out!
  end

end
