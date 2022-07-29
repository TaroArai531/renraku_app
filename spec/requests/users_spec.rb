require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#show" do
    let(:user){ create(:user) }

    before do
      sign_in user
      get user_path(user.id)
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "contains a dob data in response" do
      expect(response.body).to include(user.dob&.strftime("%Y年%m月%d日"))
    end

    it "contains a bloodtype data in response" do
      expect(response.body).to include(user.bloodtype)
    end

    it "contains a sex data in response" do
      expect(response.body).to include(user.sex)
    end
  end
end
