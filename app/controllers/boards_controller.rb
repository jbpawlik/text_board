class BoardsController < ApplicationController  
# before_action :only => [:new, :edit, :create, :destroy, :update] do
#   thing = ApiKey.find(params[:api_key])
#   redirect_to landings_path unless thing?
# end
# localhost:3000/boards?api_key=a complex string



  def index
    @boards = Board.all
    if params[:name]
      @search_results = Board.search(params[:name])
      @posts = Post.relative(@search_results[0].id)
      json_response([@search_results, @posts])
    else
      json_response(@boards)
    end
  end

  def search_by_time
    @posts = Post.timeframe(params[:time1], params[:time2])
    json_response(@posts)
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

  def update_many
    params[:names]
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