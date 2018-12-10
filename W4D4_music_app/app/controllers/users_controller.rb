# users       POST   /users(.:format)             users#create
# new_user    GET    /users/new(.:format)         users#new


class UsersController < ApplicationController
  before_action :ensure_not_logged_in

  def new
    render :index
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in!(user)
      redirect_to bands_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
