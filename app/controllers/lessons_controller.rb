class LessonsController < ApplicationController
  before_filter :verify_owner, :only => [:edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.published.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])

    if @lesson.complete?
      respond_to do |format|
        format.html
        format.json { render json: @lesson }
      end
    else
      redirect_to edit_lesson_path(@lesson)
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
  end
  
  # POST /lessons
  # POST /lessons.json
  def create
    params[:lesson].merge!(:user => current_user) if user_signed_in?
    @lesson = Lesson.new(params[:lesson])

    respond_to do |format|
      if @lesson.save
        if @lesson.user.nil?
          unclaimed = (cookies["unclaimed_lessons"] || "").split(",")
          cookies["unclaimed_lessons"] = unclaimed.push(@lesson.id).join(",")
        end
        format.html { redirect_to edit_lesson_path(@lesson) }
        format.json { render json: @lesson, status: :created, location: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :ok }
    end
  end

  private
  def verify_owner
    @lesson = Lesson.find(params[:id])
    if (
      (user_signed_in? && @lesson.user_id != current_user.id) ||
      (!user_signed_in? && (cookies["unclaimed_lessons"] || "").split(",").index(@lesson.id.to_s).nil?)
    )
      session[:user_return_to] = edit_lesson_path(@lesson)
      redirect_to new_user_session_path and return false
    end

    return true
  end

end
