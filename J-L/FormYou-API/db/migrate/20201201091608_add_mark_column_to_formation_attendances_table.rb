class AddMarkColumnToFormationAttendancesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :formation_attendances, :mark, :integer
  end
end
