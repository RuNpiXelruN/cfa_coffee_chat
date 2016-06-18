module UsersHelper

  def follow_button user
    if current_user.following? user
      button_to "Unfollow", user_follow_path(user), method: :delete
    else
      button_to "Follow", user_follow_path(user)
    end
  end

  def tutor_button user
    if current_user.is_connected? user
      button_to "Cancel", user_tutor_path(user), method: :delete
    else
      button_to "Help them :)", user_tutor_path(user)
    end
  end
end
