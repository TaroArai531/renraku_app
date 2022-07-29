class BulletinsController < ApplicationController
  before_action :admin_user, only: [:destroy]

  def index
    @user = current_user
    @bulletins = Bulletin.order('created_at desc')
  end

  def create
    @user = current_user
    @bulletin = Bulletin.new(bulletin_params)
    if @bulletin.save
      flash[:notice] = "アップロードできました。"
      redirect_to bulletins_path
    else
      @bulletins = Bulletin.all
      flash[:alert] = "アップロードできませんでした。"
      render("bulletins/index")
    end
  end

  def destroy
    Bulletin.find(params[:id]).destroy
    flash[:success] = "ファイルを削除しました。"
    redirect_to bulletins_path
  end

  private

  def bulletin_params
    params.permit(:title, :content, :file).merge(user_id: current_user.id)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
