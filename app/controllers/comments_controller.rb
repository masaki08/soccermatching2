class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.comments.build(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "コメントを投稿しました"
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
   @post = Post.find(params[:post_id])
   @comment = Comment.find(params[:id])
   if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "コメントを編集しました"
   else
    flash.now[:danger] = "編集に失敗しました"
    render 'edit'
   end
  end
  
  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   flash[:danger] = "コメントを削除しました"
   redirect_back(fallback_location: root_path)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
