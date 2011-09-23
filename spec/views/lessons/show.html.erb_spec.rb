require 'spec_helper'

describe "lessons/show.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :user_id => 1,
      :subject => "Subject",
      :title => "Title",
      :body => "MyText",
      :confidence_score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
