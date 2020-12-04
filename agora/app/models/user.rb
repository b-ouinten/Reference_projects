class User < ApplicationRecord
  # Mailer config
  after_create :welcome_send
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  belongs_to :city
  has_many :proposals
  has_many :comments
  has_many :likes
  has_many :votes

  # Active storage
  has_one_attached :avatar

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Insatnce methods
  def proposals_count
    self.proposals.count
  end

  def votes_count
    self.votes.count
  end

  def is_admin?
    self.email == 'zeagoraproject@gmail.com'
  end

  #Mailer
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end