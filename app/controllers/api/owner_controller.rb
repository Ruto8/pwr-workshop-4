class Api::OwnerController < ApplicationController

  def index
    dig = Dig.find(params[:dig_id])
    render json: dig.owner.all
  end

end
