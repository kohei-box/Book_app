class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  self.primary_key = "googlebooksapi_id"
  
end