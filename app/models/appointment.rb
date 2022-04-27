class Appointment < ApplicationRecord
    belongs_to :doctor
    belongs_to :user
    has_one :recommendation

    validates :doctor_id, presence: true
    validates :user_id, presence: true
    validates :date, presence: true, uniqueness: true
    validates :comment, presence: true, length: { minimum: 10 }
end
