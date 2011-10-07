require 'spec_helper'

describe "references/edit.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))

    @reference = assign(:reference, stub_model(Reference,
      :lesson => @lesson,
      :title => "MyString",
      :url => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit reference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_references_path(@lesson, @reference), :method => "post" do
      assert_select "input#reference_title", :name => "reference[title]"
      assert_select "input#reference_url", :name => "reference[url]"
      assert_select "textarea#reference_comment", :name => "reference[comment]"
    end
  end
end
