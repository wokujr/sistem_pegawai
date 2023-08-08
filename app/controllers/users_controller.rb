class UsersController < ApplicationController
  before_action :set_id_user, only: [:show, :edit, :update]

  def index
    @user = User.all
  end

  def show
    @karaywan = @user.karyawan
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to users_path, notice: "Successfully created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #Patch Part
  def edit      #for view
    if @user.nil?
      redirect_to root_path, alert: "NIL HAPPENED"
    end
  end
  def update    #actual patch
    if @user.update(user_params)
      redirect_to users_path, notice: "Your account information was successfully updated"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit( :username, :email, :password )
  end

  def set_id_user
    @user = User.find(params[:id])
  end

end
