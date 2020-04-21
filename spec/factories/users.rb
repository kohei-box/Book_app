FactoryBot.define do
  factory :user do
   name {"kohei"}
   sequence(:email) { |n| "TEST#{n}@example.com"}
   password {"123456"}
  end
end
