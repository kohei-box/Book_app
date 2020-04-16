class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book_pages = Book.where(user_id: current_user.id).where(category: 1).sum(:page_count)
    @book_words = Review.where(user_id: current_user.id).sum(:word_count)
    

  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
end
