require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_titleのデータ取得テスト" do
    context "page_titleがemptyの場合" do
      it "GET&READYを返す" do
        expect(full_title("")).to eq("GET&READY")
      end
    end

    context "page_titleに引数を含む場合" do
      it "title - GET&READYを返す" do
        expect(full_title("title")).to eq("title - GET&READY")
      end
    end

    context "page_titleがnilの場合" do
      it "GET&READYを返す" do
        expect(full_title(nil)).to eq("GET&READY")
      end
    end
  end
end
