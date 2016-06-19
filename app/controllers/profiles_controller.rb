class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @chats = Chat.all
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio)
  end
end
