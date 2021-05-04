class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  has_many :items, through: :cart_items

  def items_count
    self.cart_items.sum(0) { |rec|
      rec.quantity
    }
  end

  def total
    self.cart_items.sum(0.0) { |rec|
      rec.quantity * rec.item.price
    }
  end
end