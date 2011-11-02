require 'spec_helper'

describe "lesson_links/index.html.erb" do
  before(:each) do
    assign(:lesson_links, [
      stub_model(LessonLink,
        :lesson_id => 1,
        :linked_lesson_id => 1,
        :next_lesson => false
      ),
      stub_model(LessonLink,
        :lesson_id => 1,
        :linked_lesson_id => 1,
        :next_lesson => false
      )
    ])
  end

  it "renders a list of lesson_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
