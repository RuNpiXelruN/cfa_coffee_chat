class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false


  def user_list
    if params[:search]
      @users = User.where("username LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
    end
  end

  def index
    @users = User.all.order(created_at: :desc)
    @chats = Chat.all.order(created_at: :desc).where(tutorchat: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      @profile = @user.build_profile
      @profile.save
      redirect_to profile_path(@user.profile)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to profile_path(@user.profile)
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :username, :tutor, :email, :password)
  end
end
