class UserController < ApplicationController
  before_filter :authenticate_user!
  
  def auth

  end
end
