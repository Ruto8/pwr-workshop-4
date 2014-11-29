class Api::CommentsController < ApplicationController
  def index
    dig = Dig.find(params[:dig_id])
    render json: dig.comments.all
  end

  def create
    render json: Comment.create!(com_params)
  end

  def update
    com = Comment.find(params[:id])
    com.update!(com_params)

    render json: com
  end

  def show
    com = Comment.find(params[:id])
    render json: com
  end

  private
    def com_params
      params.require(:comment).permit(:body, :dig_id, :owner_id)
    end
end

