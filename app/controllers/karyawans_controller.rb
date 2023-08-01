class KaryawansController < ApplicationController
  def index
    @karyawan = Karyawan.all
  end

  def show
    @karyawan = Karyawan.find(params[:id])
    @gaji = @karyawan.gaji
  end

  def new
    @karyawan = Karyawan.new
  end

  def create
    @karyawan = Karyawan.new(employer_params)
    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @karyawan = Karyawan.find(params[:id])
    @karyawan.destroy
    redirect_to karyawans_path, notice: "Berhasil menghapus Kayawan"
  end

  private

  def employer_params
    params.require(:karyawan).permit(:nama, :alamat, :usia, :jabatan)
  end
end
