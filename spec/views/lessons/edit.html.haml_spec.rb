require 'spec_helper'

describe "lessons/edit.html.haml" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :user_id => 1,
      :subject => "MyString",
      :title => "MyString",
      :body => "MyText",
      :confidence_score => 10
    ))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path(@lesson), :method => "post" do
      assert_select "textarea#lesson_body", :name => "lesson[body]"
    end
  end
end
