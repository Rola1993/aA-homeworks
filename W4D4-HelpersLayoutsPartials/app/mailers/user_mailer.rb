class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/new'
    mail(to: user.email, subject: 'Welcome to 99cats')
  end
end
