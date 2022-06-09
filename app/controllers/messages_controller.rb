class MessagesController < ApplicationController
  def index
    @user = current_user
    @others = User.where.not(id: current_user.id)
  end

  def show
    @user = current_user
    @other = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @other.id, room_id: rooms)

    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @other.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end

    @messages = @room.messages.includes(:user)
    @message = Message.new(room_id: @room.id)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to request.referer
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id)
  end
end
