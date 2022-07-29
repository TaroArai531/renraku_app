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
FactoryBot.define do
  factory :user do
    sequence(:name, 'a') { |n| "test_#{n}" }
    sequence(:email, 'a') { |n| "test_#{n}@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Date.today }
    dob { 3.years.ago }
    bloodtype { "A型" }
    sex { "男性" }

    trait :picture do
      picture { Rack::Test::UploadedFile.new("spec/fixtures/files/test_image.png", "image/png") }
    end

    factory :admin do
      admin { true }

      trait :admin_post do
        after(:create) do |admin|
          box = create(:box)
          admin.posts << build(:post, user: admin, box: box)
        end
      end
    end

    trait :user_post do
      after(:create) do |user|
        box = create(:box)
        user.posts << build(:post, user: user, box: box)
      end
    end
  end
end
