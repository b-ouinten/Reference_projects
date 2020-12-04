class CategoryTraining < ApplicationRecord

  # Relationships
  belongs_to :training
  belongs_to :category
end
