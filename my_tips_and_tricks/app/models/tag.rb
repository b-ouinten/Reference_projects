class Tag < ApplicationRecord
  # --- Associations ---
  has_many :gossips_tags
  has_many :gossips, through: :gossips_tags

  # --- Validations ---
  validates :title,
    presence: true,
    length: { in: 3..14 }
end
