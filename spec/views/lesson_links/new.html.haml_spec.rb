require 'spec_helper'

describe "lesson_links/new.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))

    assign(:lesson_link, stub_model(LessonLink,
      :lesson => @lesson,
      :linked_lesson_id => 1,
      :next_lesson => false
    ).as_new_record)
  end

  it "renders new lesson_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_lesson_links_path(@lesson), :method => "post" do
      assert_select "input#lesson_link_linked_lesson_id", :name => "lesson_link[linked_lesson_id]"
      assert_select "input#lesson_link_next_lesson_0", :name => "lesson_link[next_lesson]"
      assert_select "input#lesson_link_next_lesson_1", :name => "lesson_link[next_lesson]"
    end
  end
end
