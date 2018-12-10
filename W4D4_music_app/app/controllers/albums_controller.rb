# album       GET    /albums/:id(.:format)        albums#show
# new_album   GET    /albums/new(.:format)        albums#new
# albums      POST   /albums(.:format)            albums#create
# edit_album  GET    /albums/:id/edit(.:format)   albums#edit
# album       PATCH  /albums/:id(.:format)        albums#update
# album       DELETE /albums/:id(.:format)        albums#destroy



class AlbumsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    unless @album.nil?
      render :show
    else
      flash[:errors] = ["That album does not exist!"]
      redirect_to bands_url
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

end
