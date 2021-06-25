class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'https://gluci-calc.vercel.app/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def forgot_password_email(user)
    @user = user
    @url  = 'https://gluci-calc.vercel.app/password/reset'
    mail(to: @user.email, subject: 'Changement de mot de passe')
  end
end
