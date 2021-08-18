class Board < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  scope :search, -> (parameter) { where('LOWER(name) like ?', "%#{parameter.downcase}%")}

end