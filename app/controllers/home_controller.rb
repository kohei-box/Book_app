class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    if user_signed_in?
      @review = current_user.reviews.build
      @reviews = Review.where(user_id: current_user.id)
    end
  end
end