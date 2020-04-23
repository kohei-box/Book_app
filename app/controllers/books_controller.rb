class BooksController < ApplicationController
  attr_reader :googlebooksapi_id, :category
  
  def index
    @books = current_user.books
    # @books = Book.where(user_id: current_user.id).where(category: 1)
  end
  
  def show
    #問題あり
    @google_book = GoogleBook.create_book(params[:googlebooksapi_id])
    @books = Book.where(googlebooksapi_id: params[:googlebooksapi_id])
    @reviews = Review.where(book_id: params[:googlebooksapi_id]).paginate(page: params[:page])
  end
  
  def create
    google_book = GoogleBook.create_book(book_params[:googlebooksapi_id])
    @book =  google_book.existing_or_new
    if @book.persisted? || @book.save
      @book_registration = BookRegistration.find_or_initialize_by(user_id: current_user.id, book_id: @book.id )
      if @book_registration.update_attributes(category: book_params[:category])
        create_review(book_params)
      else
        flash[:danger] = "書籍登録に失敗しました。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "書籍登録に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def search
    @search_form = SearchBooksForm.new(search_books_params)
    @books = GoogleBook.search(@search_form.keyword)
  end
  
  def read
    book_registrations = BookRegistration.where(category: "読んだ本")
    user = User.find(params[:id])
    @read_book = @user.book_registrations
    # user.books.book_registration.where(category: "読んだ本")
    # @user_read_books = 
  end
  
  def reading
    @user = User.find(params[:id])
    @user_books = @user.book_registrations.where(category: "読んでいる本")
  end
  
  def wish
    @user = User.find(params[:id])
    @user_books = @user.books.registrations.where(category: "読たい本")
  end
  
  
  private
  
    def book_params
      params.require(:book).permit(:googlebooksapi_id,:category,
                                  reviews: [ :content, :word_count, :rate])
    end
    
    def search_books_params
      params.fetch(:q, keyword: '').permit(:keyword)
    end
  
    def create_review(book_params)
      if @book_registration.category == "読んだ本"
        @review = @book.reviews.build(book_params[:reviews].merge(user_id: current_user.id))
        if @review.save
          flash[:primary] = "書籍を登録しました"
          redirect_to books_path
        else
          flash[:danger] = "書籍登録に成功し、レビューの作成に失敗しました"
          redirect_to books_path
        end
      end
    end
end
