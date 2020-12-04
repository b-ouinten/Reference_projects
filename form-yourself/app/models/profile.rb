class Profile < ApplicationRecord

  # Relationships
  belongs_to :user

  # Validations
  enum profile_type: [ :admin, :teacher, :student ]
  validates :profile_type, inclusion: { in: profile_types.keys }

  validates :profile_type, presence: true
  validates :user_id, uniqueness: true
end
