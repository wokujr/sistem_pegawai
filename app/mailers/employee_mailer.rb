class EmployeeMailer < ApplicationMailer
  def temp_credentials_email(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Your temporary credentials")
  end
end
