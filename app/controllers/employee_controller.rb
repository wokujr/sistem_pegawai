class EmployeeController < ApplicationController

  def new
    @position = Position.all
  end

  def create
    name = params[:nama]
    alamat = params[:alamat]
    salary = params[:salary]
    usia = params[:usia]
    @karyawan = Karyawan.new( nama: name, alamat: alamat, usia: usia, salary_id: salary )

    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      render :new, status: :unprocessable_entity
    end

  end

end