FactoryBot.define do 
  factory :doctor do
    first_name { "Joe" }
    last_name { "Black" }
    sequence(:email) { |n| "joe#{n}@gmail.com" }
    password { "password123" }
    phone { "0987654391" }
    category factory: :category
  end
end