class PostsController < ApplicationController
  def index
    @post_items = Post.all
  end

  def show
    post_items = Post.find(params[:id])
  end
end
