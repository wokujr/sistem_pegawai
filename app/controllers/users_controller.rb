class UsersController < ApplicationController
  # before_save{ self.email = email.downcase}

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created"
    else
      render 'new', status: :unprocessable_entity, turbo_stream: false
    end

    #Patch Part
    def edit      #for view
      @user = User.find(params[:id])

    end
    def update    #actual patch

    end


  end

  private
  def user_params
    params.require(:user).permit( :username, :email, :password )
  end

end
