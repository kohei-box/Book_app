class PostsController < ApplicationController
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿されました。"
      redirect_to root_url
    else
      render root_url
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "削除しました。"
    redirect_to request.referrer || users_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :picture)
  end
  
end
