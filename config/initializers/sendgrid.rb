Upsidedownacademy::Application.config.action_mailer.smtp_settings= {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "#{(Rails.env.production? ? '' : "#{Rails.env}.")}upsidedownacademy.org",
  :authentication => :plain,
  :user_name => "services@irrationaldesign.com",
  :password => "sam7panda"
}
