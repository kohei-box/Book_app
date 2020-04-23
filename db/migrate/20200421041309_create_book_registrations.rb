class CreateBookRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :book_registrations do |t|
      t.string :category
      t.references :user, foregin_key: true
      t.references :book, foregin_key: true
      
      
      t.timestamps
    end
  end
end
