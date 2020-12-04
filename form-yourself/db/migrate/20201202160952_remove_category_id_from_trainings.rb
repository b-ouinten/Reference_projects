class RemoveCategoryIdFromTrainings < ActiveRecord::Migration[6.0]
  def self.up
    remove_reference :trainings, :category, index: true
  end

  def self.down
    add_reference :trainings, :category, index: true
  end
end
