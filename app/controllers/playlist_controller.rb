class PlaylistController < ApplicationController
  before_filter :playlist_params, :only => [:show, :add_track, :remove_track, :delete]
  before_filter :authenticate_user!, :only => [:create, :delete, :remove_track]
  def index

  end

  def show
    @tracks = @playlist.tracks
    respond_to do |format|
      format.html
      format.json { render :json => @playlist.to_json(:include => :tracks)}
    end
  end

  def join
    redirect_to "/playlist/#{params[:code]}"
  end

  def create
    @playlist = Playlist.new
    if params[:code]
      @playlist.code = params[:code]
    else
      @playlist.code = generate_code
    end
    @playlist.user = @user
    redirect_to "/playlist/#{@playlist.code}"
  end

  def delete
    @playlist.destroy
  end

  def add_track
    @track = Track.new
    @track.url = params[:track_url]
    
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
