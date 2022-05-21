class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
