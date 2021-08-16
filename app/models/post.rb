class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :body, presence: true

  scope :relative, ->(group) { where('board_id = ?', group) }

end