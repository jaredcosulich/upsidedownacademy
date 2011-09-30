require 'spec_helper'

describe "lessons/show.html.haml" do
  before(:each) do
    @user = Factory(:user)
    @lesson = assign(:lesson, stub_model(Lesson,
      :user => @user,
      :subject => "Subject",
      :title => "Title",
      :body => "MyText",
      :confidence_score => 10
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/#{@user.display_name}/)
    rendered.should match(/Subject/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/10/)
  end
end
