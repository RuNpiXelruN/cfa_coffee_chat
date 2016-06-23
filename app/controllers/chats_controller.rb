class ChatsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def chat_list
    if params[:search]
      @chats = Chat.where("title LIKE ?", "%#{params[:search]}%").where(tutorchat: false).order(created_at: :desc)
    end
  end

  def index
    @users = User.all.order(created_at: :desc)
    @chats = Chat.all.where(tutorchat: false).order(created_at: :desc)
  end

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

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to chat_path(@chat)
    end
  end



  private
  def chat_params
    params.require(:chat).permit(:title, :description)
  end
end
