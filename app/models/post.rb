class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence:true
  validates :content, presence:true, length: { maximum: 200}
  validate :picture_size
  
  private
  
    def picture_size
      if picture.size > 5.megabytes
        error.add(:picture, "5MG未満である必要があります")
      end
    end

end
