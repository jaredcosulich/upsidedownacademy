class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_lesson

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment].merge(:lesson => @lesson, :user => current_user))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @lesson, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @lesson, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @lesson }
      format.json { head :ok }
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end
end
