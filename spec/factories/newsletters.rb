FactoryBot.define do
  factory :newsletter do
    sequence(:title) { |n| "title#{n}" }
    created_at { Time.now }
    association :user
  end
end
