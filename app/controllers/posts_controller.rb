class PostsController < ApplicationController
  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
   @post = Post.new(post_parmas)
   @post.customer = current_customer
   @post.save
   redirect_to post_path(@post.id)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_parmas)
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_parmas
     params.require(:post).permit(:title, :body, :customer_id)

  end
end
