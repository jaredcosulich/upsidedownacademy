require 'spec_helper'

describe "photos/new.html.haml" do
  before(:each) do
    @lesson = Factory(:lesson)
    assign(:lesson, @lesson)
    assign(:photo, stub_model(Photo,
      :lesson => @lesson,
      :title => "MyString",
      :caption => "MyString"
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_photos_path(@lesson), :method => "post" do
      assert_select "input#photo_title", :name => "photo[title]"
      assert_select "textarea#photo_caption", :name => "photo[caption]"
    end
  end
end
