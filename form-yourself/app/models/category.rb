class Category < ApplicationRecord

  # Relationships
  has_many :category_trainings, dependent: :destroy
  has_many :trainings, through: :category_trainings
end
