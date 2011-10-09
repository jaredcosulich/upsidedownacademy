require 'spec_helper'

describe CommentsController do

  def valid_attributes
    {}
  end

  before :each do
    @user = Factory(:user)
    sign_in @user
    @lesson = Factory(:lesson)
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, :lesson_id => @lesson.id.to_s, :comment => valid_attributes
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, :lesson_id => @lesson.id.to_s, :comment => valid_attributes
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, :lesson_id => @lesson.id.to_s, :comment => valid_attributes
        response.should redirect_to(@lesson)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :comment => {}
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, :lesson_id => @lesson.id.to_s, :comment => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :lesson_id => @lesson.id.to_s, :id => comment.id, :comment => {'these' => 'params'}
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => comment.id, :comment => valid_attributes
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, :lesson_id => @lesson.id.to_s, :id => comment.id, :comment => valid_attributes
        response.should redirect_to(@lesson)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => comment.id.to_s, :comment => {}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, :lesson_id => @lesson.id.to_s, :id => comment.id.to_s, :comment => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, :lesson_id => @lesson.id.to_s, :id => comment.id.to_s
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, :lesson_id => @lesson.id.to_s, :id => comment.id.to_s
      response.should redirect_to(@lesson)
    end
  end

end
