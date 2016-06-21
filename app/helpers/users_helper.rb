module UsersHelper

  def follow_button user
    if current_user.following? user
      button_to("Unfollow", user_follow_path(user), method: :delete, class: "btn btn-danger")
    else
      button_to("Follow",user_follow_path(user), class: "btn btn-primary")
    end
  end

  def tutor_button user
    if current_user.is_connected? user
      button_to("Cancel Tutoring", user_tutor_path(user), method: :delete, class: "btn btn-warning")
    else
      button_to("Add as Tutee!", user_tutor_path(user), class: "btn btn-success")
    end
  end
end
