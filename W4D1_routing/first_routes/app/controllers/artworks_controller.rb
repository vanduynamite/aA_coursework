class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

# without bang its true / false
  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def destroy
    artwork = Artwork.find(param[:id])

    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
