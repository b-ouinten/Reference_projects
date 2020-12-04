class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Relationships
  has_one :profile, dependent: :destroy
  has_many :session_participations, class_name: 'SessionParticipation', foreign_key: 'student_id', dependent: :destroy
  has_many :sessions, through: :session_participations

  has_many :trainings, :foreign_key => 'teacher_id', dependent: :destroy
end
