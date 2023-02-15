require 'rails_helper'

RSpec.describe "Bulletins", type: :request do
  describe "#index" do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
      get bulletins_path
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    before do
      @admin = create(:admin)
      sign_in @admin
    end

    it "adds a bulletin" do
      bulletin_params = FactoryBot.attributes_for(:bulletin)
      expect{
        post bulletins_path, params: { bulletin: bulletin_params }
      }.to change(@admin.bulletins, :count).by(1)
    end
  end

  describe "#destroy" do
    context "as an admin" do
      before do
        @admin = create(:admin)
        @bulletin = create(:bulletin, user: @admin)
        sign_in @admin
      end

      it "deletes a bulletin" do
        expect { delete bulletin_path(@bulletin.id)
      }.to change(@admin.bulletins, :count).by(-1)
      end
    end

    context "as a user" do
      before do
        @admin = create(:admin)
        @user = create(:user)
        @bulletin = create(:bulletin, user: @user)
        sign_in @user
      end

      it "does not delete a bulletin" do
        expect { delete bulletin_path(@bulletin.id)
        }.to_not change(Bulletin, :count)
      end

      it "redirects to the home page" do
        delete bulletin_path(@bulletin.id)
        expect(response).to redirect_to root_path
      end
    end
  end
end
