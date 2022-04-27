class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:phone]
  
  has_many :appointments   
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, uniqueness: true, 
                    presence: true, 
                    length: { is: 10 },
                    numericality: true
  

  def email_required?
    false
   end
   
   def email_changed?
    false
   end
end
