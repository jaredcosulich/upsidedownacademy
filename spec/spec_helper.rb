# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

class ActionView::TestCase::TestController
  include Devise::TestHelpers
end

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.before(:each) do
    ActionMailer::Base.deliveries.clear
  end
end

def verify_only_delivery(recipient_email, body_regexs)
  message = ActionMailer::Base.deliveries.only
  message.to_addrs.first.to_s.should include(recipient_email)
  body_regexs = [body_regexs] unless body_regexs.is_a?(Array)

  body_regexs.each do |body_regex|
    message.body.should =~ body_regex
  end
end

