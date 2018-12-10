

class SubsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @sub = Sub.new()
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_person = current_user

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
