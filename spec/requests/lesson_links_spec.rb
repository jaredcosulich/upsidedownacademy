require 'spec_helper'

describe "LessonLinks" do
  describe "GET /lesson_links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get lesson_links_path
      response.status.should be(200)
    end
  end
end
