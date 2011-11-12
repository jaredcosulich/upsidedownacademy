require 'spec_helper'

describe User do
  describe "#create" do
    it "should send a welcome email to the newly created user" do
      user = Factory(:user)
      ActionMailer::Base.deliveries.length.should == 2
      ActionMailer::Base.deliveries.first.to_addrs.should == [user.email]
    end
  end
end
