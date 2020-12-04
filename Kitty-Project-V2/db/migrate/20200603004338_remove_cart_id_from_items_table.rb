class RemoveCartIdFromItemsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :cart_id
  end
end
