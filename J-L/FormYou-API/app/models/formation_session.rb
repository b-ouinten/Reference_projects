class FormationSession < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :room
  belongs_to :formation
  has_many :formation_attendances
  has_many :users, through: :formation_attendances
  has_many :formations, through: :formation_attendances

  # VALIDATION
  validates_uniqueness_of :formation_id, scope: [:start_date, :end_date, :room_id]
  validates_uniqueness_of :room_id, scope: [:start_date, :end_date]

end
