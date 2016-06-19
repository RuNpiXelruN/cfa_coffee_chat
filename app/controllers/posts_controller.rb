class PostsController < ApplicationController

  def create
    profile = current_user.profile
    @post = profile.posts.build post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to profile_path(profile)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to profile_path(current_user.profile)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to profile_path(current_user.profile)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
