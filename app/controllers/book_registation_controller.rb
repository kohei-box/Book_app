class BookRegistationController < ApplicationController
  
  def destroy
    book = Book.find(params[:id])
    current_user.deregistration(book)
    render user
  end
end
