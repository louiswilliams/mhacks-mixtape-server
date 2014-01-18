class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    if !user_authenticated?
      redirect_to root_path
    else
      @user = get_user
    end
  end

  def user_authenticated?
    user = User.new
    if params[:identifier]
      user.identifier = params[:identifier]
      user = find_user user
      if !user
        user = User.new
        user.identifier = params[:identifier]
        user.save
      end
    elsif session[:user_identifier]
      user.identifier = session[:user_identifier]
      user = find_user user
      if !user
        session[:user_identifier] = nil
        return false
      end
    elsif params[:anonymous]
      session[:user_identifier] = :anonymous
    else
      return false
    end

    session[:user_identifier] = user.identifier
    return true
  end

  def get_user
    user = User.new

    if user_authenticated?
      user.identifier = session[:user_identifier]
      return find_user user
    else
      return nil
    end
  end

  def find_user user
    return User.find_by_identifier user.identifier
  end

  def generate_code
    begin
        word = RandomWord.nouns.next
        matches = /^[a-z]{5,12}$/ =~ word
        exists = Playlist.find_by_code word
    end until  matches && !exists
    return word
  end
end
