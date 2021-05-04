class CreateProvisionalCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :provisional_cart_items do |t|
      t.belongs_to :item, index: true
      t.string :unique_id

      t.timestamps
    end
  end
end
