class PhotosController < ApplicationController
  before_filter :load_lesson
  layout false

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = @lesson.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo].merge(:lesson => @lesson))

    respond_to do |format|
      if @photo.save
        format.html { render "layouts/close_window" }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = @lesson.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { render "layouts/close_window" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

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
