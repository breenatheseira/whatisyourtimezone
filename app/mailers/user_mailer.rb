class UserMailer < ActionMailer::Base
    ## to create: rails g mailer UserMailer
  default from: 'noreply@breenatheseira-whatisyourtimezone-breenatheseira.c9.io'
  
  def welcome_email(user)
      @user = user
      @url = login_url
      
      mail( to: user.email, subject: 'Thanks for registering')
  end
end
