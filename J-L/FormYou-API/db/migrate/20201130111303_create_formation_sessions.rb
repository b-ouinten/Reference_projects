class CreateFormationSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :capacity
      t.belongs_to :room, null: false, index: true
      t.belongs_to :formation, null: false, index: true
      t.timestamps
    end
  end
end
