class PostsController < ApplicationController
  def index; end

  def show
    post_items = Post.find(params[:id])
  end
end
