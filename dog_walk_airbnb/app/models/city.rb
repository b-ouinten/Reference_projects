class City < ApplicationRecord
  has_many :strolls
  has_many :dogsitters
  has_many :dogs
end