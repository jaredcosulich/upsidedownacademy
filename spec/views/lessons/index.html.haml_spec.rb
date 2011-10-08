require 'spec_helper'

describe "lessons/index.html.haml" do
  before(:each) do
    @user = Factory(:user)
    assign(:lessons, [
      stub_model(Lesson,
        :user => @user,
        :subject => "Subject",
        :title => "Title",
        :body => "MyText",
        :confidence_score => 20
      ),
      stub_model(Lesson,
        :user => @user,
        :subject => "Subject",
        :title => "Title",
        :body => "MyText",
        :confidence_score => 10
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "a", :text => @user.display_name, :count => 2
    assert_select "a", :text => "Title", :count => 2
  end
end
