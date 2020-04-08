class RenameClassificationColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :classification, :category
  end
end
