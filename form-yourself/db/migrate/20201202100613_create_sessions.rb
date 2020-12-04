class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.datetime :session_date

      t.belongs_to :training
      t.belongs_to :classroom

      t.timestamps
    end
  end
end
