class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
  validates :username, presence: true
  
  scope :relative, ->(group) { where('board_id = ?', group) }

  def self.timeframe(time1, time2)
    find_by_sql ["SELECT * FROM posts WHERE updated_at >= ? AND updated_at <= ?;", time1, time2]
  end
end