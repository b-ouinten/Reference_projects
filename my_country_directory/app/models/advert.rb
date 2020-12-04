class Advert < ApplicationRecord
  # Relationships
  belongs_to :account
  belongs_to :city
  belongs_to :category
end