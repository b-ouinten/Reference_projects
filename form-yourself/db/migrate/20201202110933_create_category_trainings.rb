class CreateCategoryTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :category_trainings do |t|
      t.belongs_to :training
      t.belongs_to :category

      t.timestamps
    end
  end
end
