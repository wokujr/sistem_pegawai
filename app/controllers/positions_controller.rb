class PositionsController < ApplicationController

  def create
    @position = Position.find(params[:id])
    if @position.save
      redirect_to karyawans_path, notice: "SUCCESS ADD"
    end
  end

  def show
    @position = Position.find_by(id: params[:id])
    render json: @position
  end

  def update
    @position = Position.find(params[:id])
    if @position.update(salary_form_params)
      redirect_to karyawans_path, notice: "SUCCESS"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def salary_form_params
    params.require(:salary_form).permit(:salary)
  end

end