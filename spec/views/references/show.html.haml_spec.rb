require 'spec_helper'

describe "references/show.html.erb" do
  before(:each) do
    @lesson = Factory(:lesson)
    assign(:lesson, @lesson)
    @reference = assign(:reference, stub_model(Reference,
      :lesson => @lesson,
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
