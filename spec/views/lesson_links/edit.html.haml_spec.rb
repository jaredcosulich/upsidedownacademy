require 'spec_helper'

describe "lesson_links/edit.html.erb" do
  before(:each) do
    @lesson_link = assign(:lesson_link, stub_model(LessonLink,
      :lesson_id => 1,
      :linked_lesson_id => 1,
      :next_lesson => false
    ))
  end

  it "renders the edit lesson_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_links_path(@lesson_link), :method => "post" do
      assert_select "input#lesson_link_lesson_id", :name => "lesson_link[lesson_id]"
      assert_select "input#lesson_link_linked_lesson_id", :name => "lesson_link[linked_lesson_id]"
      assert_select "input#lesson_link_next_lesson", :name => "lesson_link[next_lesson]"
    end
  end
end
