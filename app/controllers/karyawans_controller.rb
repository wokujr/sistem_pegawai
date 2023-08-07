class KaryawansController < ApplicationController
  before_action :load_position

  def index
    @karyawan = Karyawan.all
  end

  def new
    @karyawan = Karyawan.new
    load_position
  end

  def create
    @karyawan = Karyawan.new(karyawan_params)
    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      load_position
      puts @karyawan.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_karyawan
  end

  def update
    find_karyawan
    if @karyawan.update(karyawan_params)
      redirect_to karyawans_path, notice: "Karyawan berhasil di update"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @karyawan = find_karyawan
    load_position
  end

  def destroy
    @karyawan = Karyawan.find(params[:id])
    @karyawan.destroy
    redirect_to karyawans_path, notice: "Berhasil menghapus Kayawan"
  end

  private

  def find_karyawan
    @karyawan = Karyawan.find(params[:id])
  end
  def karyawan_params
    params.require(:karyawan).permit(:name, :address, :age, :position_id, :salary)
  end

  def load_position
    @position = Position.all
  end
end






