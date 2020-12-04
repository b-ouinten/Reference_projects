class RemoveOrderedAttribute < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :ordered, :boolean
  end
end
