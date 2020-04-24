class BookRegistrationController < ApplicationController
  
  def destroy
    current_user.book_registrations.find_by(book_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
