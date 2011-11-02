class LessonLinksController < ApplicationController
  before_filter :load_lesson
  layout false

  # GET /lesson_links
  # GET /lesson_links.json
  def index
    @lesson_links = LessonLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson_links }
    end
  end

  # GET /lesson_links/1
  # GET /lesson_links/1.json
  def show
    @lesson_link = @lesson.lesson_links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson_link }
    end
  end

  # GET /lesson_links/new
  # GET /lesson_links/new.json
  def new
    @lesson_link = @lesson.lesson_links.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson_link }
    end
  end

  # GET /lesson_links/1/edit
  def edit
    @lesson_link = @lesson.lesson_links.find(params[:id])
  end

  # POST /lesson_links
  # POST /lesson_links.json
  def create
    @lesson_link = @lesson.lesson_links.new(params[:lesson_link])

    respond_to do |format|
      if @lesson_link.save
        format.html { render "layouts/close_window" }
        format.json { render json: @lesson_link, status: :created, location: @lesson_link }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lesson_links/1
  # PUT /lesson_links/1.json
  def update
    @lesson_link = @lesson.lesson_links.find(params[:id])

    respond_to do |format|
      if @lesson_link.update_attributes(params[:lesson_link])
        format.html { render "layouts/close_window" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_links/1
  # DELETE /lesson_links/1.json
  def destroy
    @lesson_link = @lesson.lesson_links.find(params[:id])
    @lesson_link.destroy

    respond_to do |format|
      format.html { redirect_to lesson_links_url }
      format.json { head :ok }
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end

end
