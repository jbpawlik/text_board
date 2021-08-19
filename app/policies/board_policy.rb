class BoardPolicy < ApplicationPolicy
  attr_reader :user, :board

  def initialize(user, board)
    @user = user
    @board = board
  end

  def create
  end

  def update?
    user.admin? || !board.published?
  end

end