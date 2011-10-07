require 'spec_helper'

describe "photos/show.html.haml" do
  before(:each) do
    @lesson = Factory(:lesson)
    assign(:lesson, @lesson)
    @photo = assign(:photo, stub_model(Photo,
      :lesson => @lesson,
      :title => "Title",
      :caption => "Caption"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Caption/)
  end
end
