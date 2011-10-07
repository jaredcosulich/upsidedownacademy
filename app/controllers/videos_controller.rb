class VideosController < ApplicationController
  before_filter :load_lesson
  layout false

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new(:lesson => @lesson)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video].merge(:lesson => @lesson))

    respond_to do |format|
      if @video.save
        format.html { redirect_to upload_lesson_video_path(@lesson, @video) }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    @video = Video.find(params[:id])
    @form_info = @video.setup_youtube(url_for(@lesson))
  end

  def assign_youtube_id
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
      @video.update_attributes(:youtube_id => params[:id])
      render "layouts/close_window" and return
    elsif params[:status].to_i == 503
      flash[:notice] = "Your video was not uploaded. The YouTube service is not available. Please wait a moment and try again."
    else
      flash[:notice] = "There was an error. Please wait a moment and try again."
    end
    redirect_to upload_lesson_video_path(@video.lesson, @video) and return
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to edit_lesson_path(@lesson) }
      format.json { head :ok }
    end
  end

  def load_lesson
    @lesson = Lesson.find_by_id(params[:lesson_id])
  end
end
