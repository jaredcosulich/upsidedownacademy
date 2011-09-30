require 'spec_helper'

describe "lessons/new.html.haml" do
  it "renders new lesson form with just the subject to start" do
    assign(:lesson, stub_model(Lesson).as_new_record)
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_subject", :name => "lesson[subject]"
      assert_select "input#lesson_title", :name => "lesson[subject]", :count => 0
    end
  end

  it "renders new lesson form with just the confidence_score if the subject is filled in" do
    assign(:lesson, stub_model(Lesson, :subject => "A Subject").as_new_record)
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_subject", :name => "lesson[subject]", :count => 0      
      assert_select "select#lesson_confidence_score", :name => "lesson[confidence_score]"
    end
  end
end
