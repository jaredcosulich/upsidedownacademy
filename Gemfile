source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem "rake", "0.8.7"


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'
gem 'devise'
gem 'pg'
gem 'sluggable'
gem 'paperclip'
gem 'aws-s3', '0.6.2', :require => 'aws/s3'

gem "airbrake"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'heroku'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'  
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
