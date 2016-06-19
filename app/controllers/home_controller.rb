class HomeController < ApplicationController
  skip_before_action :require_login

  def index
    @users = User.all.order(created_at: :desc)
  end
end
