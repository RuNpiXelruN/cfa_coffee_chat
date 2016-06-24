class HomeController < ApplicationController
  include HomeHelper
  skip_before_action :require_login

  def index
    @users = User.all.order(created_at: :desc)
    @activity_posts = Post.all.order(created_at: :desc).limit(5)
    @daily_quote = INSPIRATION.sample
  end
end
