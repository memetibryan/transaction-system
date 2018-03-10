class UserMailer < ApplicationMailer
  default from:'infomemeti2@gmail.com'
  def send_welcome(user)
    mail(to: user.email, subject: “Welcome”)
  end
end
