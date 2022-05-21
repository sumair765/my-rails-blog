class UsersController < ApplicationController
  def index
    @users = User.all
    render  'user_list'
  end

  def shows
    render 'user_details'
  end
end
