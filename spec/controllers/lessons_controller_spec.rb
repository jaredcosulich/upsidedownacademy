require 'spec_helper'

describe LessonsController do

  def valid_attributes
    {:subject => "A Subject", :title => "A Title", :confidence_score => "10", :body => "Lesson Text"}
  end

  describe "GET index" do
    it "assigns all lessons as @lessons" do
      lesson = Lesson.create! valid_attributes.merge(:published_at => Date.today)
      get :index
      assigns(:lessons).should eq([lesson])
    end
  end

  describe "GET show" do
    it "assigns the requested lesson as @lesson" do
      lesson = Lesson.create! valid_attributes
      get :show, :id => lesson.id.to_s
      assigns(:lesson).should eq(lesson)
    end

    it "redirects to edit/lesson if lesson is not complete" do
      lesson = Lesson.create! valid_attributes.merge(:confidence_score => nil)
      get :show, :id => lesson.id.to_s
      response.should redirect_to(edit_lesson_path(lesson))
    end
  end

  describe "GET new" do
    it "assigns a new lesson as @lesson" do
      get :new
      assigns(:lesson).should be_a_new(Lesson)
    end
  end

  describe "GET edit" do
    before :each do
      @lesson = Factory(:lesson, :user => nil)
    end

    it "should set the user_return_to session variable if the user is not signed in" do
      request.cookies["unclaimed_lessons"] = @lesson.id.to_s
      get :edit, :id => @lesson.id.to_s
      response.should be_success
      request.session[:user_return_to].should == edit_lesson_path(@lesson)
    end

    it "doesn't allow you to edit if you're not the owner and it's not in your cookies" do
      get :edit, :id => @lesson.id.to_s

      response.should redirect_to(new_user_session_path)
    end

    it "doesn't allow you to edit if it belongs to someone else" do
      lesson_user = Factory(:user)
      other_user = Factory(:user)
      @lesson.update_attributes(:user => lesson_user)
      sign_in other_user
      get :edit, :id => @lesson.id.to_s

      response.should redirect_to(new_user_session_path)
    end

    it "allows you to edit if you're the owner" do
      user = Factory(:user)
      sign_in user
      @lesson.update_attributes(:user => user)

      get :edit, :id => @lesson.id.to_s
      response.should be_success
      assigns(:lesson).should == @lesson
    end

    it "allows you to edit if it's in your cookies" do
      request.cookies["unclaimed_lessons"] = @lesson.id.to_s
      get :edit, :id => @lesson.id.to_s
      response.should be_success
      assigns(:lesson).should == @lesson
    end
  end

  describe "POST create" do
    describe "through the wizard" do
      it "should redirect to edit/lesson until all info is filled in" do
        post :create, :lesson => {:subject => "A Subject"}
        response.should redirect_to(edit_lesson_path(Lesson.last))
      end
    end

    describe "current_user flows" do
      it "should set a cookie if the current_user doesn't exist" do
        post :create, :lesson => {:subject => "A Subject"}
        lesson = Lesson.last
        lesson.user.should be_nil
        response.cookies["unclaimed_lessons"].should == lesson.id.to_s
      end

      it "should assign the current_user to the lesson" do
        user = Factory(:user)
        sign_in(user)
        post :create, :lesson => {:subject => "A Subject"}
        lesson = Lesson.last
        lesson.user.should == user
        response.cookies["unclaimed_lessons"].should be_nil
      end
    end

    describe "with valid params" do
      it "creates a new Lesson" do
        expect {
          post :create, :lesson => valid_attributes
        }.to change(Lesson, :count).by(1)
      end

      it "assigns a newly created lesson as @lesson" do
        post :create, :lesson => valid_attributes
        assigns(:lesson).should be_a(Lesson)
        assigns(:lesson).should be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lesson as @lesson" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lesson.any_instance.stub(:save).and_return(false)
        post :create, :lesson => {}
        assigns(:lesson).should be_a_new(Lesson)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lesson.any_instance.stub(:save).and_return(false)
        post :create, :lesson => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before :each do
      @lesson = Factory(:lesson)
      sign_in(@lesson.user)
    end

    describe "with valid params" do
      it "updates the requested lesson" do
        # Assuming there are no other lessons in the database, this
        # specifies that the Lesson created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Lesson.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @lesson.id, :lesson => {'these' => 'params'}
      end

      it "assigns the requested lesson as @lesson" do
        put :update, :id => @lesson.id, :lesson => valid_attributes
        assigns(:lesson).should eq(@lesson)
      end

      it "redirects to the lesson" do
        put :update, :id => @lesson.id, :lesson => valid_attributes
        response.should redirect_to(@lesson.reload)
      end
    end

    describe "with invalid params" do
      it "assigns the lesson as @lesson" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lesson.any_instance.stub(:save).and_return(false)
        put :update, :id => @lesson.id.to_s, :lesson => {}
        assigns(:lesson).should eq(@lesson)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lesson.any_instance.stub(:save).and_return(false)
        put :update, :id => @lesson.id.to_s, :lesson => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @lesson = Factory(:lesson)
      sign_in(@lesson.user)
    end

    it "destroys the requested lesson" do
      expect {
        delete :destroy, :id => @lesson.id.to_s
      }.to change(Lesson, :count).by(-1)
    end

    it "redirects to the lessons list" do
      delete :destroy, :id => @lesson.id.to_s
      response.should redirect_to(lessons_url)
    end
  end

end
