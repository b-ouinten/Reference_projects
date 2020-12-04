class RemoveColumnOrderedFromCartsAndAddItToCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :ordered, :boolean
    add_column :cart_items, :ordered, :boolean
  end
end