class PositionsController < ApplicationController

  def create
    @position = Position.all
  end

  def show
    @position = Position.find_by(id: params[:id])

  end

end