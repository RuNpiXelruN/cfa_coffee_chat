class ChatsController < ApplicationController

  def show
    @chat = Chat.find(params[:id])
    @comments = @chat.comments
  end

  def create
    profile = current_user.profile
    @chat = profile.chats.build(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
      redirect_to profile_path(profile)
    end
  end



  private
  def chat_params
    params.require(:chat).permit(:title, :description)
  end
end
