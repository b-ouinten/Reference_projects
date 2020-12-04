# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Setup SMTP with SendGid
ActionMailer::Base.smtp_settings = {
  domain: 'my-adverts.herokuapp.com',
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY']
}