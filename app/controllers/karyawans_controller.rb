class KaryawansController < ApplicationController
  def index
    @karyawan = Karyawan.all
  end

  def show
    @salary = @karyawan.salary
    @position = Position.find_by(params[:id])
  end

  def new
    @karyawan = Karyawan.new
  end

  def create
    @karyawan = Karyawan.new(karyawan_params)
    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_karyawan
  end

  def update
    if @karyawan.update(karyawan_params)
      redirect_to karyawans_path, notice: "Karyawan berhasil di update"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @karyawan = Karyawan.find(params[:id])
    @karyawan.destroy
    redirect_to karyawans_path, notice: "Berhasil menghapus Kayawan"
  end

  private

  def set_karyawan
    @karyawan = Karyawan.find_by(id: params[:id])
  end
  def karyawan_params
    params.require(:karyawan).permit(:nama, :alamat, :usia, :title, salary_attributes: [:amount, :position_id])
  end
end