FactoryBot.define do 
  factory :appointment do
    user_id { :user }
    # doctor_id { :doctor }
    comment { "Comment for the appointment!" }
    date { Time.now + 1.week }
  end
end