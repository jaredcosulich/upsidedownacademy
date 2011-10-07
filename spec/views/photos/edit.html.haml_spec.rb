require 'spec_helper'

describe "photos/edit.html.haml" do
  before(:each) do
    @lesson = Factory(:lesson)
    assign(:lesson, @lesson)
    @photo = assign(:photo, stub_model(Photo,
      :lesson => @lesson,
      :title => "MyString",
      :caption => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_photos_path(@lesson, @photo), :method => "post" do
      assert_select "input#photo_title", :name => "photo[title]"
      assert_select "textarea#photo_caption", :name => "photo[caption]"
    end
  end
end
