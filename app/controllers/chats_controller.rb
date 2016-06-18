class ChatsController < ApplicationController
  include ChatsHelper

  def show
    @chat = Chat.find(params[:id])
  end

  def create
    profile = current_user.profile
    @chat = profile.chats.build(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
      redirect_to profile_path(profile)
    end
  end

  def like
    @chat = Chat.find(params[:id])
    if @chat.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end


  private
  def chat_params
    params.require(:chat).permit(:title, :description)
  end
end
