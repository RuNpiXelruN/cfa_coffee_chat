class TutoringRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.tutees << user
    @chat = Chat.new
    @chat.user = current_user
    @chat.profile = current_user.profile
    @chat.title = user.username
    @chat.tutorchat = true
    @chat.save
    redirect_to profile_path(user.profile)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.tutees.delete(user)
    chat = current_user.chats.find_by(title: user.username)
    chat.delete
    redirect_to profile_path(user.profile)
  end
end
