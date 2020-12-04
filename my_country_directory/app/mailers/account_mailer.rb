class AccountMailer < ApplicationMailer
  default from: 'wazo6556@tutanota.com'
  
  def send_signup_email(account)
    # Retrieve the user instance in order to pass it to the view.
    @account = account
    
    # Define an @url variable that we use in the e-mail view.
    @url  = 'http://my_adverts.fr/login' 
    
    # Call mail() method that sends the e-mail by defining the recipient and the subject.
    mail(to: @account.email, subject: 'Welcome to us !') 
  end
end