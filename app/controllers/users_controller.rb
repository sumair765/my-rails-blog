class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    render 'user_list'
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    render 'user_details'
  end
end
