class UserController < ApplicationController
  before_filter :authenticate_user!

  def auth
    respond_to do |format|
        format.json {render :json => @user.to_json(:include => :playlists) }
        format.html
    end
  end
end
