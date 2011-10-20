require 'spec_helper'

describe "lessons/new.html.haml" do
  it "renders new lesson form with just the subject to start" do
    assign(:lesson, stub_model(Lesson).as_new_record)
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_subject", :name => "lesson[subject]"
      assert_select "input#lesson_title", :name => "lesson[title]"
      assert_select "textarea#lesson_body", :name => "lesson[body]", :count => 0
    end
  end

  it "renders new lesson form with just the lesson text if the subject and title are filled in" do
    assign(:lesson, stub_model(Lesson, :subject => "A Subject", :title => "A Title").as_new_record)
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_subject", :name => "lesson[subject]", :count => 0
      assert_select "input#lesson_title", :name => "lesson[title]", :count => 0
      assert_select "textarea#lesson_body", :name => "lesson[body]"
    end
  end
end
