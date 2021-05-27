class PastTime
    include ActiveModel::Model
    
    # 過去六日間の日付を取得
    def get_week_date
      last_week = []
      time = Time.zone.now
      (0..5).each do |d|
        last_week << time - d.days
      end
      return last_week
    end
    
end

# PastTime.new
# #<PastTime:0x0000000004dc3850 @last_week=[], @time=Fri, 09 Apr 2021 18:04:43 JST +09:00> 
