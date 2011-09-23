require 'spec_helper'

describe "lessons/edit.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :user_id => 1,
      :subject => "MyString",
      :title => "MyString",
      :body => "MyText",
      :confidence_score => 1
    ))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path(@lesson), :method => "post" do
      assert_select "input#lesson_user_id", :name => "lesson[user_id]"
      assert_select "input#lesson_subject", :name => "lesson[subject]"
      assert_select "input#lesson_title", :name => "lesson[title]"
      assert_select "textarea#lesson_body", :name => "lesson[body]"
      assert_select "input#lesson_confidence_score", :name => "lesson[confidence_score]"
    end
  end
end
