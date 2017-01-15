class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    p post_params
    Post.create(post_params)
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:name, :caption)
  end

end
