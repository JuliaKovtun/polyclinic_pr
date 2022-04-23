FactoryBot.define do 
  factory :doctor do
    first_name { "Joe" }
    last_name { "Bidon" }
    sequence(:email) { |n| "joebidon#{n}@gmail.com" }
    sequence(:password) { |n| "password123#{n}" }
    sequence(:phone) { "0987654391" }
    category factory: :category
  end
end