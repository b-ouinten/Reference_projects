class AddQuantityFieldToCartItemAndProvisionalCartItemTables < ActiveRecord::Migration[5.2]
  def up
    add_column :cart_items, :quantity, :integer, :default=> 1
    add_column :provisional_cart_items, :quantity, :integer, :default=>1
  end

  def down
    remove_column :cart_items, :quantity
    remove_column :provisional_cart_items, :quantity
  end
end
