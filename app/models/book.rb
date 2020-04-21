class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :book_registrations, dependent: :destroy
  # self.primary_key = "googlebooksapi_id"
  
  validates :googlebooksapi_id, presence: true
  validates :title, presence: true
  
end