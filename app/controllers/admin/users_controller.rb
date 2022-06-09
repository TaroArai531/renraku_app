class Admin::UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy]

  def index
    @user = current_user
    @users = User.where.not(id: current_user.id)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
