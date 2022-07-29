FactoryBot.define do
  factory :message do
    sequence(:content) { |n| "#{n}_text_message" }
    association :user
    association :room
  end
end
