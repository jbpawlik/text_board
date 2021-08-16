class PostsController < ApplicationController

  def index
    @board = Board.find(params[:board_id])
    @posts = Post.relative(@board.id)
    json_response(@posts)
  end

  def create
    @board = Board.find(params[:board_id])
    @post = Post.create!(post_params)
    json_response(@board, @post, :created)
  end

  def update
    @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
    if @post.update!(post_params)
      render status: 200, json: {
        message: "This post has been updated successfully"
      }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render status: 200, json: {
        message: "This post has been successfully deleted"
      }
    end
  end


  private 
    def post_params
      params.permit(:title, :body)
    end
end