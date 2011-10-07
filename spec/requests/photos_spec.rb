require 'spec_helper'

describe "Photos" do
  describe "GET /photos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      lesson = Factory(:lesson)
      get lesson_photos_path(lesson)
      response.status.should be(200)
    end
  end
end
