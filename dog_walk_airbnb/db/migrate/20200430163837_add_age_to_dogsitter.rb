class AddAgeToDogsitter < ActiveRecord::Migration[5.2]
  def change
    add_column :dogsitters, :age, :integer
  end
end
