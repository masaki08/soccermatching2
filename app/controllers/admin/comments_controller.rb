class Admin::CommentsController < ApplicationController
   before_action :authenticate_admin!
  def destroy
     @comment = Comment.find_by(id: params[:id])
     @comment.destroy if @comment
     flash[:success] = "コメントを削除しました"
     redirect_to admin_post_path(@comment.post)a
  end
end
