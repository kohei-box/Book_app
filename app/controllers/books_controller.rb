class BooksController < ApplicationController

  def search
    @search_form = SearchBooksForm.new(search_books_params)
    @books = GoogleBook.search(@search_form.keyword)
  end
  
  private
  
    def search_books_params
      params.fetch(:q, keyword: '').permit(:keyword)
      # form_withのscopeで:qをパラメータとしてグループ化できる
    end
  
end
