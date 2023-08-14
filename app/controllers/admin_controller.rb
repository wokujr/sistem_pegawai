class AdminController <ApplicationController

  def new
    @position = Position.all
    @karyawan = Karyawan.new
    @position_data = @position.to_json
  end

  def create
    @position = Position.all
    @karyawan = Karyawan.new(karyawan_params)
    generate_temporary_user(@karyawan)
    if @karyawan.save
      redirect_to admin_path, notice: 'Karyawan was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def generate_temporary_user(karyawan)
    temp_password = generate_temporary_password
    email = "temp_#{SecureRandom.hex(5)}@email.com"
    user = User.create(
      username: "temp_#{SecureRandom.hex(5)}",
      email: email,
      password: temp_password
    )
    EmployeeMailer.temp_credentials_email(user, email, temp_password).deliver_now
    karyawan.update(user: user)
  end

  def generate_temporary_password
    SecureRandom.hex(8)
  end

  def karyawan_params
    params.require(:karyawan).permit(:name, :address, :age, :position_id, :salary, :user_id)
  end
end