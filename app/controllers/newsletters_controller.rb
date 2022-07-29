class NewslettersController < ApplicationController
  before_action :admin_user, only: [:destroy]

  def index
    @user = current_user
    @newsletters = Newsletter.order('created_at desc')
  end

  def create
    @user = current_user
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      flash[:notice] = "アップロードできました。"
      redirect_to newsletters_path
    else
      @newsletters = Newsletter.all
      flash[:alert] = "アップロードできませんでした。"
      render("newsletters/index")
    end
  end

  def destroy
    Newsletter.find(params[:id]).destroy
    flash[:success] = "ファイルを削除しました。"
    redirect_to newsletters_path
  end

  private

  def newsletter_params
    params.permit(:title, :letter).merge(user_id: current_user.id)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
