class CreateAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.boolean :is_online, default: false
      t.belongs_to :city
      t.belongs_to :category, index: true
      t.belongs_to :account, index: true

      t.timestamps
    end
  end
end