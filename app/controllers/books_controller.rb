class BooksController < ApplicationController
  
  
  def index
    @books = current_user.books
    # @books = Book.where(user_id: current_user.id).where(category: 1)
  end

  
  def create
    google_book = GoogleBook.create_book(create_book_params[:googlebooksapi_id])
    existing_book =  google_book.existing_or_new(current_user)
    if existing_book.persisted?
     existing_book.update_attributes(category: category_params[:category])
    else
     @book = google_book.book_registration(current_user, category_params[:category])
     @book.save
    end
    flash[:primary] = "本を登録しました"
    (existing_book.category || @book.category) == 1 ? (redirect_to user_path(current_user)) : (redirect_to books_path(current_user))
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
  
    def category_params
      params.require(:book).permit(:category)
    end
  
    def create_book_params
      params.permit(:googlebooksapi_id)
    end
    
    def search_books_params
      params.fetch(:q, keyword: '').permit(:keyword)
      # form_withのscopeで:qをパラメータとしてグループ化できる
    end
  
end
