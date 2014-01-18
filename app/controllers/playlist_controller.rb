class PlaylistController < ApplicationController
  before_filter :playlist_params, :only => [:show, :add_track, :remove_track, :delete]
  def index
  end

  def show
    @tracks = @playlist.tracks
  end

  def create
    @playlist = Playlist.new
    if params[:code]
      @playlist.code = params[:code]
    else
      @playlist.code = RandomWord.nouns.next
    end
    render "show"
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
      if !@playlist
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
