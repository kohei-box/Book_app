class BooksController < ApplicationController
  attr_reader :googlebooksapi_id, :category
  
  def index
    puts "ok"
    puts params[:user_id].nil?
    @books = Book.where(user_id: params[:user_id])
    # @books = Book.where(user_id: current_user.id).where(category: 1)
  end
  
  def show
    @google_book = GoogleBook.create_book(params[:googlebooksapi_id])
    @books = Book.where(googlebooksapi_id: params[:googlebooksapi_id])
    @reviews = Review.where(book_id: params[:googlebooksapi_id]).paginate(page: params[:page])
  end
  
  def new
    @book = Book.new
    @book.reviews.build
  end
  
  def create
    google_book = GoogleBook.create_book(book_params[:googlebooksapi_id])
    existing_book =  google_book.existing_or_new(current_user)
    if existing_book.persisted?
      existing_book.update_attributes(category: book_params[:category])
      @book = existing_book
    else
      @book = google_book.book_registration(current_user, book_params[:category])
      @book.save!
    end
    create_review(book_params[:reviews])
    flash[:primary] = "本を登録しました"
    @book.category == 1 ? (redirect_to user_path(current_user)) : (redirect_to books_path(current_user))
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
  
    def book_params
      params.require(:book).permit(:googlebooksapi_id,:category,
                                  reviews: [ :content, :word_count, :rate])
    end
    
    def search_books_params
      params.fetch(:q, keyword: '').permit(:keyword)
    end
  
    def  create_review(book_params)
      if @book.category == 1
        @review = @book.reviews.build(book_params.merge(user_id: current_user.id, book_id: @book.id))
          unless @review.save!
            flash[:danger] = "レビューの作成に失敗しました。"
            redirect_to books_path
          end
      end
    end
end
