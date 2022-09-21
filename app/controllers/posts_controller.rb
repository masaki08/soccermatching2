class PostsController < ApplicationController
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
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
   @post = Post.new(post_parmas)
   @post.customer = current_customer
   if @post.save
     redirect_to posts_path(@post.id)
   else
     @posts = Post.all
     render :new
   end
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

  def search
     @posts = Post.search(params[:keyword])
     @keyword = params[:keyword]
     render "index"
  end

  private

  def post_parmas
     params.require(:post).permit(:title, :body, :customer_id)

  end
end
