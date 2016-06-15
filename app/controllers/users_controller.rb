class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def index
    @users = User.all.order(created_at: :desc)
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
