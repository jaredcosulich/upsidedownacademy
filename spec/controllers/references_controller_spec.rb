require 'spec_helper'

describe ReferencesController do

  def valid_attributes
    {}
  end

  before :each do
    @lesson = Factory(:lesson)
  end

  describe "GET index" do
    it "assigns all references as @references" do
      reference = Reference.create! valid_attributes
      get :index, :lesson_id => @lesson.id.to_s
      assigns(:references).should eq([reference])
    end
  end

  describe "GET show" do
    it "assigns the requested reference as @reference" do
      reference = Reference.create! valid_attributes
      get :show, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s
      assigns(:reference).should eq(reference)
    end
  end

  describe "GET new" do
    it "assigns a new reference as @reference" do
      get :new, :lesson_id => @lesson.id.to_s
      assigns(:reference).should be_a_new(Reference)
    end
  end

  describe "GET edit" do
    it "assigns the requested reference as @reference" do
      reference = Reference.create! valid_attributes
      get :edit, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s
      assigns(:reference).should eq(reference)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reference" do
        expect {
          post :create, :lesson_id => @lesson.id.to_s, :reference => valid_attributes
        }.to change(Reference, :count).by(1)
      end

      it "assigns a newly created reference as @reference" do
        post :create, :lesson_id => @lesson.id.to_s, :reference => valid_attributes
        assigns(:reference).should be_a(Reference)
        assigns(:reference).should be_persisted
      end

      it "redirects to the created reference" do
        post :create, :lesson_id => @lesson.id.to_s, :reference => valid_attributes
        response.should be_success
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reference as @reference" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :reference => {}
        assigns(:reference).should be_a_new(Reference)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :reference => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reference" do
        reference = Reference.create! valid_attributes
        # Assuming there are no other references in the database, this
        # specifies that the Reference created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reference.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :lesson_id => @lesson.id.to_s, :id => reference.id, :reference => {'these' => 'params'}
      end

      it "assigns the requested reference as @reference" do
        reference = Reference.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => reference.id, :reference => valid_attributes
        assigns(:reference).should eq(reference)
      end

      it "redirects to the reference" do
        reference = Reference.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => reference.id, :reference => valid_attributes
        response.should redirect_to(lesson_path(@lesson))
      end
    end

    describe "with invalid params" do
      it "assigns the reference as @reference" do
        reference = Reference.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s, :reference => {}
        assigns(:reference).should eq(reference)
      end

      it "re-renders the 'edit' template" do
        reference = Reference.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s, :reference => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reference" do
      reference = Reference.create! valid_attributes
      expect {
        delete :destroy, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s
      }.to change(Reference, :count).by(-1)
    end

    it "redirects to the references list" do
      reference = Reference.create! valid_attributes
      delete :destroy, :lesson_id => @lesson.id.to_s, :id => reference.id.to_s
      response.should redirect_to(edit_lesson_path(@lesson))
    end
  end

end
