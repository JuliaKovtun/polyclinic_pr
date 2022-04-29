FactoryBot.define do 
  factory :appointment do
    user_id { :user }
    comment { "Comment for the appointment!" }
    date { Time.now + 1.week }
  end
end