FactoryBot.define do
  factory :bulletin do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "#{n}_test_content"}
    created_at { Time.now }
    association :user
  end
end
