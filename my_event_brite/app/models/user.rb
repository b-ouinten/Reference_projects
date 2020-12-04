class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  after_create :welcome_send
  
  # Set association config
  has_many :attendances, foreign_key: 'participant_id', class_name: 'Attendance'
  has_many :occasions, through: :attendances
  has_many :events, foreign_key: 'admin_id', class_name: 'Event'
  
  # Set validatios config
  validates :email,
  presence: true,
  uniqueness: true,
  format: { 
    with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Please enter a valid email.'
  }
  
  private
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end