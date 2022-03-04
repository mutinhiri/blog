class PostsController < ApplicationController
  before_action :current_user, only: [:create]
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.posts.includes(:comments)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    new_post.update_posts_counter
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.user.id}/posts/", flash: {alert: 'Succesfully created post!'}
        else
          render :new, flash.now[:error] = "Error, post not saved"
          render action: 'new'
        end
      end
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
