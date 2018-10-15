ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.mail[:send_grid_username],
  :password => Rails.application.credentials.mail[:send_grid_password],
  :domain => 'shared.fitness',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
