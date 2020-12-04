class CreateFormationCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_categories do |t|
      t.belongs_to :formation, null: false, index: true
      t.belongs_to :category, null: false, index: true
      t.timestamps
    end
  end
end
