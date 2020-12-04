class Stroll < ApplicationRecord
  belongs_to :city
  belongs_to :dogsitter
  belongs_to :dog
end
