class SearchBooksForm
  include ActiveModel::Model
  # イニシャライズなどができるようになる。
  include ActiveModel::Attributes
  #attributeが使用できるよになる。
  
  attribute :keyword, :string
end