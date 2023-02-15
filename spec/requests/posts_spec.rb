require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#index" do
    before do
      @admin = create(:admin)
      @other = create(:user)
      sign_in @admin
      get posts_path(@admin.id)
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
      @box = create(:box)
      @admin = create(:admin)
      create(:user_box, user: @admin, box: @box)
      @other = create(:user)
      create(:user_box, user: @other, box: @box)
      @post = create(:post, user: @admin, box: @box)
      @post_other = create(:post, user: @other, box: @box)
      sign_in @admin
      get post_path(@other.id)
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "contains post data in response" do
      expect(response.body).to include(@post.comment)
      expect(response.body).to include(@post_other.comment)
    end

    it "responce successfully" do
      get post_path, params: { id: @admin.id }
      expect(response).to be_successful
    end
  end

  describe "#destroy" do
    before do
      @box = create(:box)
      @admin = create(:admin)
      @post = create(:post, user: @admin, box: @box)
      sign_in @admin
    end

    it "deletes a newsletter" do
      expect { delete post_path(@post.id)
    }.to change(@admin.posts, :count).by(-1)
    end
  end
end
