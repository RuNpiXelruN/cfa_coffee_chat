class PostsController < ApplicationController

  def create
    profile = current_user.profile
    @post = profile.posts.build post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to profile_path(profile)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
