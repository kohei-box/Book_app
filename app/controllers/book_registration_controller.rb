class BookRegistrationController < ApplicationController
  
  def index
    
  end
  
  def create
    
    my_book = BookRegistration.find_by(user_id: current_user.id,
                                     googlebooksapi_id: book_params[:googlebooksapi_id]) 
    # 登録したい書籍が既存データかどうか調べる。
    # それ如何によって下の条件分岐で更新か新規作成か分ける。
    if my_book.nil?
    # my_bookの中身がnilかどうか？
      # 中身がnilの場合(=新規データ)
      my_book = BookRegistration.create(book_params)
      if my_book.save
        if my_book.category == "読んだ本"
          notice[:success] = "読んだ本に登録しました"
          redirect_to new_review_path
        else
          notice[:success] = "#{my_book.category}に登録しました"
          redirect_to("user/id/wish") ##categoryの本棚 暫定
        end
      else
      # 予期せぬエラーが起こった場合 
      # こちらで更新データを指定しているのでエラーになるとしたらシステムエラーだと思うけど...
        redirect_back(fallback_location: root_path)
      end
    else
      # 中身のデータがある場合(=既存データ)
      if my_book.update(book_params[:category])
        if my_book.category == "読んだ本"
          redirect_to new_review_path
        else
          redirect_to("user/id/wish") ##categoryの本棚 暫定
        end
      else
        # 予期せぬエラーが起こった場合 
        # こちらで更新データを指定しているのでエラーになるとしたらシステムエラーだと思うけど...
      notice
      redirect_back(fallback_location: root_path)
      end
    end
  end
  
  def destroy
    current_user.book_registrations.find_by(book_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
    
    def book_params
      params.require(:book).permit(:googlebooksapi_id, :category)
    end
    
end
