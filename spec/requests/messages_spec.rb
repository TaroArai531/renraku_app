require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "#index" do
    before do
      @admin = create(:admin)
      @other = create(:user)
      sign_in @admin
      get messages_path(@admin.id)
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "contains others data in response" do
      expect(response.body).to include(@other.name)
    end
  end

  describe "#show" do
    before do
      @room = create(:room)
      @admin = create(:admin)
      create(:user_room, user: @admin, room: @room)
      @other = create(:user)
      create(:user_room, user: @other, room: @room)
      @message = create(:message, user: @admin, room: @room)
      @message_other = create(:message, user: @other, room: @room)
      sign_in @admin
      get message_path(@other.id)
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "contains message data in response" do
      expect(response.body).to include(@message.content)
      expect(response.body).to include(@message_other.content)
    end

    it "responce successfully" do
      get message_path, params: { id: @admin.id }
      expect(response).to be_successful
    end
  end
end
