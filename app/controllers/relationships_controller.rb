class RelationshipsController < ApplicationController
  before_action :authenticate_customer!

  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  # フォローしている人一覧
  def follower
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  # フォローされている人一覧
  def followed
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end

end