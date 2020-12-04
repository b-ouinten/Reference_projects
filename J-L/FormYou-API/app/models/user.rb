class User < ApplicationRecord

  # DEVISE
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist


  # VALIDATIONS
  validates :email, presence: true
  validates :first_name, :last_name, :email, presence: true

  # ASSOCIATIONS
  has_many :formation_attendances 
  has_many :formations, through: :FormationAttendances
  has_many :formation_sessions, through: :formation_attendances
  has_many :rooms, through: :formation_sessions
  belongs_to :role
  has_many :rooms, through: :formation_sessions
  has_many :formations, :foreign_key => 'teacher_id'
  
end
