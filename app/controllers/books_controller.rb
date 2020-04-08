class BooksController < ApplicationController
  
  def index
    @books = current_user.books
  end
  
  def create
    google_book = GoogleBook.new_book(create_book_params[:googlebooksapi_id])
    @book = google_book.book_registration(current_user)
    if @book.save
      flash[:primary] = "本を登録しました"
      redirect_to books_path    else
      flash.now[:danger] = "本の登録に失敗しました"
      render search_books_path
    end
  end
  
  def destroy
    Book.find(params[:id]).destroy
    flash[:primary] = "本棚から削除しました"
    redirect_back( fallback_location: books_path )
  end

  def search
    @search_form = SearchBooksForm.new(search_books_params)
    @books = GoogleBook.search(@search_form.keyword)
  end
  
  private
  
    def create_book_params
      params.permit(:googlebooksapi_id)
    end
    
    def search_books_params
      params.fetch(:q, keyword: '').permit(:keyword)
      # form_withのscopeで:qをパラメータとしてグループ化できる
    end
  
end
