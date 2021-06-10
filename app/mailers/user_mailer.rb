class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def forgot_password_email(user)
    @user = user
    @url  = 'http://localhost:3000/password/reset'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
