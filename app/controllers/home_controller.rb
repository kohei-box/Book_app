class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @user = current_user
    if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end