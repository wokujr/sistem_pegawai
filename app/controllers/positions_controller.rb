class PositionsController < ApplicationController

  def get_salary

    position = Position.find(params[:id])
    render json: { salary: position_id}
  end

end