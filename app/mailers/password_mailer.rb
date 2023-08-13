class PasswordMailer < ApplicationMailer
  def reset
    @token = params[:user].signed_id(purpose: "password reset", expires_in: 15.minutes)

    mail to: "to@example.org"
  end
end
