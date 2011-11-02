require 'spec_helper'

describe "lesson_links/edit.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))
    @lesson_link = assign(:lesson_link, stub_model(LessonLink,
      :lesson => @lesson,
      :linked_lesson_id => 1,
      :next_lesson => false
    ))
  end

  it "renders the edit lesson_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_lesson_link_path(@lesson, @lesson_link), :method => "put" do
      assert_select "input#lesson_link_linked_lesson_id", :name => "lesson_link[linked_lesson_id]"
      assert_select "input#lesson_link_next_lesson_0", :name => "lesson_link[next_lesson]"
      assert_select "input#lesson_link_next_lesson_1", :name => "lesson_link[next_lesson]"
    end
  end
end
