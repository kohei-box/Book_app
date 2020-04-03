class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    if user_signed_in?
      @post = current_user.posts.build
      @posts = Post.where(user_id: current_user.id)
    end
  end
end
