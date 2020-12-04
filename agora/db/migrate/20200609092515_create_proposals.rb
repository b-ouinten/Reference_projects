class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :purpose
      t.text :description
      t.boolean :is_online
      t.belongs_to :city, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
