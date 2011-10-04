require 'spec_helper'

describe "resources/new.html.erb" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :title => "MyString",
      :url => "MyString",
      :comments => "MyText"
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resources_path, :method => "post" do
      assert_select "input#resource_title", :name => "resource[title]"
      assert_select "input#resource_url", :name => "resource[url]"
      assert_select "textarea#resource_comments", :name => "resource[comments]"
    end
  end
end
