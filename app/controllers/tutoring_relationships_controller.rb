class TutoringRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.tutees << user
    redirect_to profile_path(user.profile)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.tutees.delete(user)
    redirect_to profile_path(user.profile)
  end
end
