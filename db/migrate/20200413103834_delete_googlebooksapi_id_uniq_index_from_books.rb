class DeleteGooglebooksapiIdUniqIndexFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_index :books, :googlebooksapi_id
    add_index :books, :googlebooksapi_id
  end
end
