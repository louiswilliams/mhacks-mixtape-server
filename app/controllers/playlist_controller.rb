class PlaylistController < ApplicationController
  def index

  end

  def show
  end

  def create
    @playlist = Playlist.new
    if params[:code]
      @playlist.code = params[:code]
    else
      @playlist.code = RandomWord.nouns.next
    end
  end

  def delete
  end

  def add_track
  end

  def remove_track
  end

  def vote
  end

  def playlist_params
    @playlist = Playlist.new
    if params[:code]
      @playlist = Playlist.find_by_code params[:code]
    else
      redirect_to root_path
    end
  end
end
