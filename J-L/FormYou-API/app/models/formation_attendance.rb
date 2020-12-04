class FormationAttendance < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :formation
  belongs_to :formation_session

  # VALIDATIONS
  validates_uniqueness_of :user_id, scope: [:formation_session_id]

end
