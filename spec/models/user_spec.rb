require 'spec_helper'

describe User do
  describe "#create" do
    it "should send a welcome email to the newly created user" do
      user = Factory(:user)
      verify_only_delivery(user.email, [])
    end
  end
end
