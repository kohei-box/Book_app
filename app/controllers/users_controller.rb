class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book_pages = Book.where(user_id: current_user.id).where(category: 1).sum(:page_count)
    @book_words = Review.where(user_id: current_user.id).sum(:word_count)
    

  end
  
  def new
  end
  
end
