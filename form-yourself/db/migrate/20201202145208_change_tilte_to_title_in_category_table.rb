class ChangeTilteToTitleInCategoryTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :tilte, :title
  end
end
