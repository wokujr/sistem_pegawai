class KaryawansController < ApplicationController
  def index
    @karyawan = Karyawan.all
  end

  def show
    @karyawan = Karyawan.find(params[:id])
    @gaji = @karyawan.gaji
  end

  def new
  end

end
