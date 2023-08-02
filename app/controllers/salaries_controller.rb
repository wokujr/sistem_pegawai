class SalariesController < ApplicationController
  def new
    @karyawan = Karyawan.find_by(id: params[:id])
    @salary = Salary.new
  end
  def create
    @karyawan = Karyawan.find_by(id: params[:karyawan_id])
    if @karyawan.nil?
      redirect_to karyawans_path, alert: "Karyawan tidak ditemukan"
      return
    end
    @salary = karyawan.build.salary(salary_params)
    if @salary.save
      redirect_to karyawan_path(@karyawan), notice: "Berhasil menambahkan Gaji"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def salary_params
    params.require(:salary).permit(:amount, :position_id)
  end

end
