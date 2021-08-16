class PostsController < ApplicationController

  def index
    @board = Board.find(params[:board_id])
    @posts = Post.relative(@board.id)
    json_response(@posts)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def create
    # @board = Board.find(params[:board_id])
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  def update
    @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
    @post2 = Post.update(post_params)
    if @post.username === @post2.username && @post.author === @post2.author
      # @post.update!(post_params)
      @post = Post.update
      render status: 200, json: {
        message: "This post has been updated successfully"
      }
    else
      render status: 403, json: {
        message: "Post not updated; confirm that you are the author"
      }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.username == @post.author && @post.delete
      render status: 200, json: {
        message: "This post has been successfully deleted"
      }
    else
      render status: 403, json: {
        message: "Unable to delete post; confirm that you are the author"
      }
    end
  end

  private
    def post_params
      params.permit(:title, :body, :username, :author, :board_id)
    end
end