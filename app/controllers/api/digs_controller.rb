class Api::DigsController < ApplicationController
  def index
    render json: Dig.all
  end

  def create
    render json: Dig.create!(dig_params)
  end

  def update
    dig = Dig.find(params[:id])
    dig.update!(dig_params)

    render json: dig
  end

  def destroy
    dig = Dig.find(params[:id])
    dig.destroy!

    head 200
  end

  def vote
    dig = Dig.find(params[:id])
    random_user = User.all.sample(1).first
    dig.votes.create! amount: params[:vote], voter: random_user

    head 200
  end

  def show
    dig = Dig.find(params[:id])
    render json: dig
  end

  private
    def dig_params
      params.require(:dig).permit(:title, :body, :owner_id)
    end
end

