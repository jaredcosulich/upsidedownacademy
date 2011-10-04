require 'spec_helper'

describe "resources/edit.html.erb" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :title => "MyString",
      :url => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders the edit resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resources_path(@resource), :method => "post" do
      assert_select "input#resource_title", :name => "resource[title]"
      assert_select "input#resource_url", :name => "resource[url]"
      assert_select "textarea#resource_comments", :name => "resource[comments]"
    end
  end
end
