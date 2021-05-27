class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    # @book_pages = @user.books.registrations.sum(:page_count)
    # @book_words = Review.where(user_id: current_user.id).sum(:word_count)
    gon.book = []
    gon.book_pages = []
    gon.book_words = []
    
    gon.data = []
    6.times do
      gon.data << rand(100.0)
    end

    
    
    
  end
  
  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def read
    myshelf_action("読んだ本")
  end
  
  def reading
    myshelf_action("読んでいる本")
  end
  
  def wish
    myshelf_action("読みたい本")
  end
  
  private
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def myshelf_action(cate)
      @title = cate
      @user = User.find(params[:id])
      @read_books_list = @user.book_registrations.where(category: cate)
      @read_books = @read_books_list.map { |read_book| Book.find(read_book.book_id) }
      render 'show_myshelf'
    end
end
