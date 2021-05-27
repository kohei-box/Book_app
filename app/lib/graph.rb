class Graph
    include ActiveModel::Model
    
    
    ##書籍総計
    #当日の特定ユーザーの読了書籍数　１週間推移
    #bookの配列の0は、総計から数を引くことから、初日分=総計のため引いてはいけないから。
    # last_week = 他から持ってくる。
    def a
      
      book = [0]
      last_week.each do |d|
        from = d.beginning_of_day
        to = d.end_of_day
        book << user.book_registrations.where("(category = ?)", "読んだ本" ).where("updated_at BETWEEN ? AND ?", from, to).count
      end
      
      week_read_books_list = []
      week_read_books_sum = 0
      book.each do |i|
        books = user.book_registrations.where("(category = ?)", "読んだ本").count
        week_read_books_sum += i
        week_read_books_list << books - week_read_books_sum
      end
      
    end 
    
    
    #word総数
    review_list = []
    last_week.each do |d|
      from = d.beginning_of_day
      to = d.end_of_day
      review_list <<  user.reviews.where("created_at BETWEEN ? AND ?", from, to)
    end
    
    
    word_all = Review.all.sum(:word_count)
    word_list = [word_all]
    word_sum = 0
    (0..5).each do |d|
      (0..5).each do |i|
        unless review_list[d][i].blank?
          word_sum += review_list[d][i].word_count
        end
      end
      word_list << word_all - word_sum
    end
     
    
    # ##ward数総計
    user = User.find_by(email: "yama@book.com")
    review_all = user.reviews.all #レビューの総数
    last_week #先週の日付
  
    
    
end