require 'spec_helper'

describe "resources/show.html.erb" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :title => "Title",
      :url => "Url",
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
