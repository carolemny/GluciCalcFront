class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'https://react-glucicalc.vercel.app/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def forgot_password_email(user)
    @user = user
    @url  = 'https://react-glucicalc.vercel.app/password/reset'
    mail(to: @user.email, subject: 'Changement de mot de passe')
  end
end
