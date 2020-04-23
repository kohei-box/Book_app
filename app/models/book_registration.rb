class BookRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  # validates :category, presence: true
end
