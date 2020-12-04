class Session < ApplicationRecord

  # Relationships
  belongs_to :training
  belongs_to :classroom

  has_many :session_participations
  has_many :students, through: :session_participations
end
