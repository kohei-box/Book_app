class GoogleBook 
  # < ApplicationRecord
  attr_reader :googlebooksapi_id, :author, :buy_link, :description,
              :image, :published_at, :title, :page_count, :publisher
  
  
  class << self
    include GoogleBooksApi
    
    def search(keyword)
      url = url_from_keyword(keyword)
      json = get_json_from_url(url)
      items = json['items']
      books = []
      items&.each do |item|
        books << GoogleBook.new(item)
      end
      books
    end
  end
  
  def initialize(item)
    @item = item
    @volume_info = @item['volumeInfo']
    retrieve_attribute
  end
  
  
  def retrieve_attribute
    @googlebooksapi_id = @item['id']
    @author = first_author
    @buy_link = @item['saleInfo']['buyLink']
    @description = @volume_info['description']
    @image = image_url
    @published_at = @volume_info['publishedDate']
    @title = @volume_info['title']
    @publisher = @volume_info['publisher']
    @page_count = @volume_info['pageCount']
  end
  
  def image?
    image.present? ? true : false
  end
  
  
  private
    
    def image_url
      if @volume_info['imageLinks']
        @volume_info['imageLinks']['smallThumbnail']
      else
        ''
      end
    end
    
    def first_author
      @volume_info['authors']&.first
    end
        
  
end