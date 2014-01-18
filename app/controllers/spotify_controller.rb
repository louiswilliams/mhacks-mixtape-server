class SpotifyController < ApplicationController
  def search
    render :json => Spotify.search(params[:query])
  end
end
