class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @karaywan = @user.karyawan
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Successfully created"
    else
      render 'new', status: :unprocessable_entity
    end

    #Patch Part
    def edit      #for view
      @user= User.find(params[:id])
      if @user.nil?
        redirect_to root_path, alert: "NIL HAPPENED"
      end
    end
    def update    #actual patch
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to users_path
      else
        render 'edit'
      end
    end


  end

  private
  def user_params
    params.require(:user).permit( :username, :email, :password )
  end

end
