require 'spec_helper'

describe PhotosController do

  before :each do
    @lesson = Factory(:lesson)
  end

  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all photos as @photos" do
      photo = Factory(:photo)
      get :index, :lesson_id => photo.lesson_id.to_s
      assigns(:photos).should eq([photo])
    end
  end

  describe "GET show" do
    it "assigns the requested photo as @photo" do
      photo = Factory(:photo)
      get :show, :lesson_id => photo.lesson_id.to_s, :id => photo.id.to_s
      assigns(:photo).should eq(photo)
    end
  end

  describe "GET new" do
    it "assigns a new photo as @photo" do
      lesson = Factory(:lesson)
      get :new, :lesson_id => lesson.id.to_s
      assigns(:photo).should be_a_new(Photo)
    end
  end

  describe "GET edit" do
    it "assigns the requested photo as @photo" do
      photo = Factory(:photo)
      get :edit, :lesson_id => photo.lesson_id.to_s, :id => photo.id.to_s
      assigns(:photo).should eq(photo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Photo" do
        expect {
          post :create, :lesson_id => @lesson.id.to_s, :photo => valid_attributes
        }.to change(Photo, :count).by(1)
      end

      it "assigns a newly created photo as @photo" do
        post :create, :lesson_id => @lesson.id.to_s, :photo => valid_attributes
        assigns(:photo).should be_a(Photo)
        assigns(:photo).should be_persisted
      end

      it "redirects to the photo's lesson" do
        post :create, :lesson_id => @lesson.id.to_s, :photo => valid_attributes
        response.should be_success
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved photo as @photo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :photo => {}
        assigns(:photo).should be_a_new(Photo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :photo => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested photo" do
        photo = Photo.create! valid_attributes
        # Assuming there are no other photos in the database, this
        # specifies that the Photo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Photo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :lesson_id => @lesson.id.to_s, :id => photo.id, :photo => {'these' => 'params'}
      end

      it "assigns the requested photo as @photo" do
        photo = Photo.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => photo.id, :photo => valid_attributes
        assigns(:photo).should eq(photo)
      end

      it "redirects to the photo" do
        photo = Photo.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => photo.id, :photo => valid_attributes
        response.should redirect_to(lesson_path(@lesson))
      end
    end

    describe "with invalid params" do
      it "assigns the photo as @photo" do
        photo = Photo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => photo.id.to_s, :photo => {}
        assigns(:photo).should eq(photo)
      end

      it "re-renders the 'edit' template" do
        photo = Photo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => photo.id.to_s, :photo => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested photo" do
      photo = Photo.create! valid_attributes
      expect {
        delete :destroy, :lesson_id => @lesson.id.to_s, :id => photo.id.to_s
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos list" do
      photo = Photo.create! valid_attributes
      delete :destroy, :lesson_id => @lesson.id.to_s, :id => photo.id.to_s
      response.should redirect_to(lesson_path(@lesson))
    end
  end

end
