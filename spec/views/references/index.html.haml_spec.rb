require 'spec_helper'

describe "references/index.html.erb" do
  before(:each) do
    assign(:references, [
      stub_model(Reference,
        :title => "Title",
        :url => "Url",
        :comments => "MyText"
      ),
      stub_model(Reference,
        :title => "Title",
        :url => "Url",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of references" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
