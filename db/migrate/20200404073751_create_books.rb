class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :googlebooksapi_id, null: false
      t.string :title, null: false
      t.string :author
      t.string :image
      t.text   :description
      t.string :buy_link
      t.date   :published_at
      t.timestamps
    end
    
    add_index :books, :googlebooksapi_id, unique: true
    add_index :books, [:author, :title]
  end
end
