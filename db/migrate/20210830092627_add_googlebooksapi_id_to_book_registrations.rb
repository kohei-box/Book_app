class AddGooglebooksapiIdToBookRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :book_registrations, :googlebooksapi_id, :string
  end
end
