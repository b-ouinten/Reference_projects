class SessionParticipation < ApplicationRecord

  # Relationships
  belongs_to :session
  belongs_to :student, class_name: 'User'
end
