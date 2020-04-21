class ReviewsController < ApplicationController
  
  def create
    # @review = current_user.reviews.build(review_params)
    # if @review.save
    #   flash[:success] = "投稿されました。"
    #   redirect_to root_url
    # else
    #   render root_url
    # end
  end
  
  def destroy
    @review.destroy
    flash[:success] = "削除しました。"
    redirect_to request.referrer || users_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:content, :picture, :word_count, :rate)
  end
  
end
