class TutoringRelationshipsController < ApplicationController

  def create
    current_user.tutor = true
    redirect_to profile_path(current_user)
  end
end
