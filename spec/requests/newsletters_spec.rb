require 'rails_helper'

RSpec.describe "Newsletters", type: :request do
  describe "#index" do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
      get newsletters_path
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

    it "adds a newsletter" do
      newsletter_params = FactoryBot.attributes_for(:newsletter)
      expect{
        post newsletters_path, params: { newsletter: newsletter_params }
      }.to change(@admin.newsletters, :count).by(1)
    end
  end

  describe "#destroy" do
    context "as an admin" do
      before do
        @admin = create(:admin)
        @newsletter = create(:newsletter, user: @admin)
        sign_in @admin
      end

      it "deletes a newsletter" do
        expect { delete newsletter_path(@newsletter.id)
      }.to change(@admin.newsletters, :count).by(-1)
      end
    end

    context "as a user" do
      before do
        @admin = create(:admin)
        @user = create(:user)
        @newsletter = create(:newsletter, user: @user)
        sign_in @user
      end

      it "does not delete a newsletter" do
        expect { delete newsletter_path(@newsletter.id)
        }.to_not change(Newsletter, :count)
      end

      it "redirects to the home page" do
        delete newsletter_path(@newsletter.id)
        expect(response).to redirect_to root_path
      end
    end
  end
end
