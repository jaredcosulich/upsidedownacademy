require 'spec_helper'

describe "lesson_links/show.html.erb" do
  before(:each) do
    @lesson_link = assign(:lesson_link, stub_model(LessonLink,
      :lesson_id => 1,
      :linked_lesson_id => 1,
      :next_lesson => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
