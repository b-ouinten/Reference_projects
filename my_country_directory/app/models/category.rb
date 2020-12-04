class Category < ApplicationRecord
  # Add ancestry to the model
  has_ancestry

  # Relationships
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_many :adverts

  # Instance methods
  
end