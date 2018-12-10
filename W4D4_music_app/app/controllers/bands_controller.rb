# bands       GET    /bands(.:format)             bands#index
# band        GET    /bands/:id(.:format)         bands#show
# new_band    GET    /bands/new(.:format)         bands#new
# bands       POST   /bands(.:format)             bands#create
# edit_band   GET    /bands/:id/edit(.:format)    bands#edit
# band        PATCH  /bands/:id(.:format)         bands#update
# band        DELETE /bands/:id(.:format)         bands#destroy


class BandsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    unless @band.nil?
      render :show
    else
      flash[:errors] = ["That band does not exist!"]
      redirect_to albums_url
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def band_params
    params.require(:band).permit(:user_id, :name)
  end

end
