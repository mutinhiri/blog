class PostsController < ApplicationController
  def index
    @post_items = Post.all
  end

  def show
    2post_items = Post.find(params[:id])
  end
end
