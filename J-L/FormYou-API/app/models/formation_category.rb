class FormationCategory < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :formation
  belongs_to :category
end
