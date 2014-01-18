class PlaylistController < ApplicationController
  before_filter :playlist_params, :only => [:show, :add_track, :remove_track, :delete]
  before_filter :authenticate_user!, :only => [:create, :delete, :remove_track]
  before_filter :anonymize_user, :only => [:show]
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
      @playlist.code = params[:code].downcase
    else
      @playlist.code = generate_code
    end
    @playlist.user = @user
    if !Playlist.find_by_code(@playlist.code)
      @playlist.save
      respond_to do |format|
        format.json {render :json => @playlist}
        format.html {redirect_to "/playlist/#{@playlist.code}"}
      end
    else
      redirect_to root_path
    end
  end

  def delete
    @playlist.destroy
  end

  def add_track
    @track = Track.new
    @track.url = params[:track_url]
    @track.playlist = @playlist
    # lookup = Spotify.lookup(params[:track_url])
    # if lookup
      @track.save
    # end
    redirect_to "/playlist/#{@playlist.code}"

   end

  def remove_track
  end

  def vote
    if is_anonymous?
      puts "Anony"
      votes = Vote.where("anonymous = ? AND  track_id = ?",session[:user_identifier],params[:track_id])
      if votes.length == 0
        @vote = Vote.new
        @vote.track_id = params[:track_id]
        @vote.anonymous = session[:user_identifier]
        @vote.save
      end
    end
  end

  def playlist_params
    @playlist = Playlist.new
    if params[:code]
      @playlist = Playlist.find_by_code params[:code].downcase
      if !@playlist
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
