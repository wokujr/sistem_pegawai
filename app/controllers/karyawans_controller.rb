class KaryawansController < ApplicationController
  before_action :load_position
  before_action :require_user, except: [:index]

  def index
    @karyawan = Karyawan.all
    @user= current_user
  end

  def new
    @user = User.find(session[:user_id])
    @position_data = @position.to_json
    if @user
      @karyawan = Karyawan.new
      load_position
    end
  end

  def create
    @karyawan = Karyawan.new(karyawan_params)
    @karyawan.user = current_user
    if @karyawan.save
      redirect_to karyawans_path, notice: "Berhasil menambahkan karyawan baru"
    else
      load_position
      puts @karyawan.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def get_salary
    position = Position.find(params[:id])
    render json: { salary: position.salary }
  end

  def edit
    find_karyawan
  end

  def update
    find_karyawan
    if @karyawan.update(karyawan_params)
      redirect_to karyawan_path(@karyawan), notice: "Karyawan berhasil di update"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    find_karyawan
    authorize @karyawan
    @karyawan.user = current_user
    load_position
    @user = User.all
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
    params.require(:karyawan).permit(:name, :address, :age, :salary, :user_id, position_ids: [])
  end

  def load_position
    @position = Position.all
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

end

