class AddTeacherIdToFormationTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :formations, :teacher, references: :users, index: true
  end
end
