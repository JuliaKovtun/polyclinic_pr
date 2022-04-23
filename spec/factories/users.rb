FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}  
    password { "12345678" }
    first_name { "Joe" }
    last_name { "Bidon" }
    sequence(:phone) { "0123456789" } 
  end
end