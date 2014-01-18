class UserController < ApplicationController
  before_filter :authenticate_user!

  def auth
    redirect_to playlist_index_path
  end
end
