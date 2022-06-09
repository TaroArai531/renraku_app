class PostsController < ApplicationController
  before_action :set_current_user

  def index
    @others = User.where.not(id: current_user.id)
    @admin = User.where(:admin => true)
  end

  def new
    @post = Post.new
  end

  def show
    @other = User.find(params[:id])
    boxes = current_user.user_boxes.pluck(:box_id)
    user_boxes = UserBox.find_by(user_id: @other.id, box_id: boxes)

    if user_boxes.nil?
      @box = Box.new
      @box.save
      UserBox.create(user_id: current_user.id, box_id: @box.id)
      UserBox.create(user_id: @other.id, box_id: @box.id)
    else
      @box = user_boxes.box
    end

    @posts = @box.posts.includes(:user).order('created_at desc')
    @post = Post.new(box_id: @box.id)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "登録しました。"
      redirect_to request.referer
    end
  end

  def detail
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "更新しました。"
      redirect_to posts_path
    else
      flash[:alert] = "更新できませんでした。"
      render("post/edit")
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "ファイルを削除しました。"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:wake_up, :bathroom, :bathroom_time, :sleep, :pick_up, :pick_up_time,
                                 :date, :comment, :temperature, :box_id).merge(user_id: current_user.id)
  end

  def set_current_user
    @user = current_user
  end
end
