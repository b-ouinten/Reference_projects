class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :description
      t.integer :age
      t.belongs_to :city

      t.timestamps
    end
  end
end
