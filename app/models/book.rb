class Book < ApplicationRecord
  belongs_to :user
  
  
  def category_number (book, user)
       book.existing(user).category
  end
end