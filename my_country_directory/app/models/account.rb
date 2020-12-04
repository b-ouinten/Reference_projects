class Account < ApplicationRecord
  # Relationships
  # belongs_to :city
  has_many :adverts

  # Callbacks
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private
  
    def welcome_send
      AccountMailer.send_signup_email(self).deliver_now
    end
end