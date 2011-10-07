require 'spec_helper'

describe "references/new.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))
    
    assign(:reference, stub_model(Reference,
      :lesson => @lesson,  
      :title => "MyString",
      :url => "MyString",
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new reference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_references_path(@lesson), :method => "post" do
      assert_select "input#reference_title", :name => "reference[title]"
      assert_select "input#reference_url", :name => "reference[url]"
      assert_select "textarea#reference_comment", :name => "reference[comment]"
    end
  end
end
