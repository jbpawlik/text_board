class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :body, presence: true
  # validates :board_id, optional: true

  scope :relative, ->(group) { where('board_id = ?', group) }
  # scope :timeframe, ->(begin, end) {where("created_at >= ? AND created_at <= ?", begin, end)}

    # scope :today, where(:transfer_date => Date.today...Date.tomorrow)
    # scope :today, where("transfer_date BETWEEN ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
    # Model.where(':date BETWEEN from_date AND to_date', date: Date.current)


  def self.timeframe(time1, time2)
    find_by_sql ["SELECT * FROM posts WHERE updated_at >= ? AND updated_at <= ?;", time1, time2]
    # find_by_sql("SELECT * FROM posts WHERE updated_at <= '8-17-2021' AND updated_at >= '8-16-2021';")
  end

  #coming back from lunch: try find_by_sql
end