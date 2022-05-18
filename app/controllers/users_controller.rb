class UsersController < ApplicationController
  def index
    render 'user_list'
  end

  def shows
    render 'user_details'
  end
end
