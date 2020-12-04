class Event < ApplicationRecord
  # Set associations config
  has_many :attendances, foreign_key: 'occasion_id', class_name: 'Attendance'
  has_many :participants, through: :attendances
  belongs_to :admin, class_name: 'User'

  # Set validations config
  validates :start_date,
    presence: true,
    # See app/validators/not_in_past_validator.rb
    not_in_past: true

  validates :duration,
    presence: true,
    numericality: { greater_than: 0 }

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 5..1000 }

  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than: 1001 }

  validates :location,
    presence: true

  validate :duration_multiple_of_5

  # Instance method
  def end_date
    self.start_date + duration * 60
  end

  private
  def duration_multiple_of_5
    errors.add(:duration, 'must be multiple of 5') unless !duration || duration % 5 == 0
  end
end