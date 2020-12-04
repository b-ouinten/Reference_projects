class CartItem < ApplicationRecord
  # Validations
  validates :cart_id, uniqueness: { scope: :item_id, message: 'Ce produit est déjà présent dans votre panier !' }
  
  belongs_to :cart 
  belongs_to :item
end
