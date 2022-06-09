class HomeController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @posts = Post.where(user_id: @user.id)
  end
end
