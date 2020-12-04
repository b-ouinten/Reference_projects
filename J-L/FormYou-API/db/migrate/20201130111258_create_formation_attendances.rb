class CreateFormationAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_attendances do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :formation, null: false, index: true
      t.belongs_to :formation_session, null: false, index: true
      t.timestamps
    end
  end
end
