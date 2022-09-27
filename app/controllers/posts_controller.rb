class PostsController < ApplicationController
   before_action :authenticate_customer!
  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:customer)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = current_customer.posts.build(post_params)
   if @post.save
     redirect_to posts_path(@post.id)
   else
     @posts = Post.all
     render :new
   end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
     @posts = Post.search(params[:keyword])
     @post = Post.new
     @keyword = params[:keyword]
     render "index"
  end

  private

  def post_params
     params.require(:post).permit(:title, :body, :customer_id, :image)

  end
end
