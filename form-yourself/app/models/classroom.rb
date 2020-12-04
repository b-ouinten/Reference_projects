class Classroom < ApplicationRecord
  validates :room_code, uniqueness: true

  # Relationships
  has_many :sessions
end
