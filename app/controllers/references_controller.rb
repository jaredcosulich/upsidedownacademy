class ReferencesController < ApplicationController
  before_filter :load_lesson
  layout false

  # GET /references
  # GET /references.json
  def index
    @references = Reference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @references }
    end
  end

  # GET /references/1
  # GET /references/1.json
  def show
    @reference = @lesson.references.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reference }
    end
  end

  # GET /references/new
  # GET /references/new.json
  def new
    @reference = Reference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reference }
    end
  end

  # GET /references/1/edit
  def edit
    @reference = @lesson.references.find(params[:id])
  end

  # POST /references
  # POST /references.json
  def create
    @reference = Reference.new(params[:reference].merge(:lesson => @lesson))

    respond_to do |format|
      if @reference.save
        format.html { render "layouts/close_window" }
        format.json { render json: @reference, status: :created, location: @reference }
      else
        format.html { render action: "new" }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /references/1
  # PUT /references/1.json
  def update
    @reference = @lesson.references.find(params[:id])

    respond_to do |format|
      if @reference.update_attributes(params[:reference])
        format.html { render "layouts/close_window" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference = @lesson.references.find(params[:id])
    @reference.destroy

    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :ok }
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end
end
