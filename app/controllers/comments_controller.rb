class CommentsController < ApplicationController

  def create
    profile = current_user.profile
    chat = Chat.find(params[:chat_id])
    @comment = chat.comments.build(comment_params)
    @comment.profile_id = profile.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to chat_path(chat) }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
