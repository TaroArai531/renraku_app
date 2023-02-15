FactoryBot.define do
  factory :post do
    bathroom        { "うんち（普通）" }
    bathroom_time   { Time.now }
    sequence(:comment) { |n| "test#{n}" }
    date            { Date.today }
    pick_up         { "お母さん" }
    pick_up_time    { Time.now }
    sleep           { Time.now }
    temperature     { "36.5℃" }
    wake_up         { Time.now }
    created_at      { Date.today }
    association :user
    association :box
  end
end
