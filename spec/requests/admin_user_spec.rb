require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  describe "#index" do
    context "as an admin user" do
      before do
        admin = create(:admin)
        sign_in admin
        @users = create(:user)
        get admin_users_path(admin.id)
      end

      it "returns a 200 status code" do
        expect(response).to have_http_status(200)
      end

      it "contains a other user data in response" do
        expect(response.body).to include(@users.name)
      end

    end

    context "as an ordinary user" do
      before do
        @user = build(:user)
        sign_in @user
        get admin_users_path(@user.id)
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end

      it "redirects to home page" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
