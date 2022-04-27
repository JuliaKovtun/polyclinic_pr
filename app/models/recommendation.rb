class Recommendation < ApplicationRecord
    belongs_to :appointment
    validates :recommendation, presence: true, length: { minimum: 10 }
    validates :appointment_id, presence: true
end
