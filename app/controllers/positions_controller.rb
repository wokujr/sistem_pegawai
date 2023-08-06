class PositionsController < ApplicationController
  def new
    @position = Position.new
  end
  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to karyawans_path, notice: "SUCCESS ADD"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def position_params
    params.require(:position).permit(:salary, :title)
  end

end