class FavoritesController < ApplicationController
  before_action :authenticate_customer!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]

  def create
    Favorite.create(customer_id: current_customer.id, post_id: @post.id)
    redirect_to posts_path
  end

  def destroy
    Favorite.find_by(customer_id: current_customer.id, post_id: @post.id).destroy
    redirect_to posts_path
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end
end
