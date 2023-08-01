class GajisController < ApplicationController
  def new
    @karyawan = Karyawan.find(params[:karyawan_id])
    @gaji = Gaji.new
  end
  def create
    @karyawan = Karyawan.find(params[:karyawan_id])
    @gaji = @karyawan.build_gaji(gaji_karyawan)

    if @gaji.save
      redirect_to karyawan_path(@karyawan), notice:"Berhasil memasukan Gaji"
    else
      render new, status: :unprocessable_entity
    end
  end


  private
  def gaji_karyawan
    params.require(:gaji).permit(:karyawan_id, :kode_gaji)
  end

end
