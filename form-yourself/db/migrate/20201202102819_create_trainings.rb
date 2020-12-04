class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.text :description

      t.belongs_to :teacher, index: true
      t.belongs_to :category

      t.timestamps
    end
  end
end
