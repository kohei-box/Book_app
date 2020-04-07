class ChangePostsToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :reviews
  end
end
