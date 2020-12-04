class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  has_many :items, through: :cart_items

  def total
    items_prices = self.items.map { |item|
      item.price
    }

    items_prices.sum
  end

  def items_count
    self.items.count
  end
end
