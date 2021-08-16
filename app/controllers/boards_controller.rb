class BoardsController < ApplicationController

  def index
    @boards = Board.all
    json_response(@boards)
  end

  def show
    @board = Board.find(params[:id])
    json_response(@board)
  end

  def create
    @board = Board.create!(board_params)
    json_response(@board, :created)
  end

  def update
    @board = Board.find(params[:id])
    if @board.update!(board_params)
      render status: 200, json: {
        message: "This board has been updated successfully"
      }
    end
  end

  def destroy 
    @board = Board.find(params[:id])
    if @board.destroy
      render status: 200, json: {
        message: "This board has been succesfully deleted"
      }
    end
  end

  private 
    def board_params
      params.permit(:name)
    end

end