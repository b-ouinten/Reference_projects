class CreateSessionParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :session_participations do |t|
      t.belongs_to :student, index: true
      t.belongs_to :session

      t.timestamps
    end
  end
end
