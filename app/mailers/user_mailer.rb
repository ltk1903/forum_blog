class UserMailer < ApplicationMailer
    default from: 'no-reply@theforum.com'
  
    def login_notification(user)
      @user = user
      mail(to: @user.email, subject: 'Login Successful')
    end
end
  