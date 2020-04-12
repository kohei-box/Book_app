class AddWordcountToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :word_count, :integer
    add_column :reviews, :rate, :float
  end
end
