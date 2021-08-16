class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :body, presence: true
  # validates :board_id, optional: true

  scope :relative, ->(group) { where('board_id = ?', group) }
  scope :
end