class AddDefaultValueToOrdered < ActiveRecord::Migration[5.2]
  def up
    change_column :cart_items, :ordered, :boolean, default: false
  end
end
