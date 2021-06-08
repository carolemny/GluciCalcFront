class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3001/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
