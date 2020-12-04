class AddCommentCommentsRelation < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.belongs_to :comment, index: true
      
    end
  end
end
