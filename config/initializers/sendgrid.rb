Upsidedownacademy::Application.config.action_mailer.smtp_settings= {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "#{(Rails.env.production? ? '' : "#{Rails.env}.")}upsidedownacademy.org",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_EMAIL'],
  :password => ENV['SENDGRID_PASSWORD']
}
