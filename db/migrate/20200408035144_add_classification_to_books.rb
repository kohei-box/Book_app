class AddClassificationToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :classification, :integer
  end
end
