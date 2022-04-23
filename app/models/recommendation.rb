class Recommendation < ApplicationRecord
    validates :recommendation, presence: true, length: { minimum: 10 }
    validates :appointment_id, presence: true
end
