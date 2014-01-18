class SpotifyController < ApplicationController
  def search
    render :json => Spotify.search(params[:query])
  end

  def lookup
    render :json => Spotify.lookup(params[:query])
  end
end
