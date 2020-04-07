class RemoveDescriptionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :description, :text
    remove_column :books, :buy_link, :string
    remove_column :books, :published_at, :date
    
  end
end
