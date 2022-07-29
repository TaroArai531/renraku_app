# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)
#  picture_content_type   :string(255)
#  picture_file_name      :string(255)
#  picture_file_size      :bigint
#  picture_updated_at     :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "devise" do
    context "ユーザー登録" do
      it "name/email/password/password_confirmationがある場合、有効である" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "nameがない場合、無効である" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("が入力されていません。")
      end

      it "emailがない場合、無効である" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end

      it "passwordがない場合、無効である" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

      it "重複したメールアドレスの場合、無効である" do
        user1 = create(:user, email: "test@gmail.com")
        user2 = build(:user, email: "test@gmail.com")
        user2.valid?
        expect(user2.errors[:email]).to include("は既に使用されています。")
      end
    end
  end
end
