class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :book_registrations, dependent: :destroy
  has_many :users, through: :book_registrations
  # self.primary_key = "googlebooksapi_id"
  
  validates :googlebooksapi_id, presence: true
  validates :title, presence: true
  
  
 
end