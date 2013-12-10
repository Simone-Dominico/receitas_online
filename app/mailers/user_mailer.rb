class UserMailer < ActionMailer::Base
 	default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://receitas.com/signin'
    mail(to: @user.email, subject: 'Bem vindo a receitas Online')
  end
end
