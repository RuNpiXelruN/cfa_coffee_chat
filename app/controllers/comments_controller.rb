class CommentsController < ApplicationController

  def create
    profile = current_user.profile
    chat = Chat.find(params[:chat_id])
    @comment = chat.comments.build(comment_params)
    @comment.profile_id = profile.id
    if @comment.save
      redirect_to chat_path(@comment.chat)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to chat_path(@comment.chat)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to chat_path(@comment.chat)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
