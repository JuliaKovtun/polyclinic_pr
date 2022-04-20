class Doctor < ApplicationRecord
  belongs_to :category
  has_many :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:phone]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, uniqueness: true, 
                    presence: true, 
                    length: { is: 10 },
                    numericality: true
  validates :category, presence: true

  scope :by_category, -> (category_id) { category_id.present? ? where(category_id: category_id ) : all }

  def email_required?
    false
   end
   
   def email_changed?
    false
   end
end
