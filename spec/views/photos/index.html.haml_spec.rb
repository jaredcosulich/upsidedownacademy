require 'spec_helper'

describe "photos/index.html.haml" do
  before(:each) do
    @lesson = Factory(:lesson)
    assign(:lesson, @lesson)
    assign(:photos, [
      stub_model(Photo,
        :lesson => @lesson,
        :title => "Title",
        :caption => "Caption"
      ),
      stub_model(Photo,
        :lesson => @lesson,
        :title => "Title",
        :caption => "Caption"
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @lesson.id.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
  end
end
