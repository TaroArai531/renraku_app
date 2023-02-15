FactoryBot.define do
  factory :user_box do
    association :user
    association :box
  end
end
