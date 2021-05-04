class CartItem < ApplicationRecord
  # Relationship
  belongs_to :cart 
  belongs_to :item
end
