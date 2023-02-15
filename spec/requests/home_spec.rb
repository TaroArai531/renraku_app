require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

    before do
      sign_in user
      get root_path
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end
  end

  describe "devise" do
    context "ログイン:登録済みユーザーの場合" do
      let(:user){ create(:user, :picture) }

      it "Home画面にアクセスできる" do
        sign_in user
        get root_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context "ログイン:未登録ユーザーの場合" do
      it "ログイン画面にredirectされる" do
        get root_path
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
