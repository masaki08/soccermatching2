class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all
    admin_posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments || []
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
