class EmployeeController < ApplicationController

  def new
    @position = Position.all
  end

  def create
    name = params[:name]
    alamat = params[:address]
    salary = params[:salary]
    usia = params[:age]
    @karyawan = Karyawan.new( name: name, alamat: alamat, usia: usia, salary_id: salary )

    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      render :new, status: :unprocessable_entity
    end

  end

end