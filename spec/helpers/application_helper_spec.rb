require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_titleのデータ取得テスト" do
    context "page_titleがemptyの場合" do
      it "連絡帳を返す" do
        expect(full_title("")).to eq("連絡帳")
      end
    end

    context "page_titleに引数を含む場合" do
      it "title - 連絡帳を返す" do
        expect(full_title("title")).to eq("title - 連絡帳")
      end
    end

    context "page_titleがnilの場合" do
      it "連絡帳を返す" do
        expect(full_title(nil)).to eq("連絡帳")
      end
    end
  end
end
