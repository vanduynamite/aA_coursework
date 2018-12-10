# track       GET    /tracks/:id(.:format)        tracks#show
# new_track   GET    /tracks/new(.:format)        tracks#new
# tracks      POST   /tracks(.:format)            tracks#create
# edit_track  GET    /tracks/:id/edit(.:format)   tracks#edit
# track       PATCH  /tracks/:id(.:format)        tracks#update
# track       DELETE /tracks/:id(.:format)        tracks#destroy
# notes_track POST   /tracks/:id/notes(.:format)  tracks#notes
# notes_track PATCH  /tracks/:id/notes(.:format)  tracks#notes


class TracksController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find_by(id: params[:id])
    unless @track.nil?
      render :show
    else
      flash[:errors] = ["That track does not exist!"]
      redirect_to tracks_url
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

  def notes
    # POST for new
    # PATCH for updates
  end

end
