class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      #send email
      PasswordMailer.with(user: @user).reset.deliver_later
      end
    redirect_to root_path, notice: "we have been sent password reset to your email"
  end

  def edit

  end
  def update

  end
end