class EmployeeMailer < ApplicationMailer
  def temp_credentials_email(user, email, password)
    @user = user
    @email = email
    @password = password
    mail(to: @user.email, subject: "Your temporary credentials")
  end
end
