class RenameNameToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :name, :title
  end
end
