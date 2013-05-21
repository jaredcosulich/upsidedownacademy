class Video < ActiveRecord::Base
  belongs_to :lesson

  before_save :convert_youtube_url_to_id
  attr_accessor :youtube_url

  def setup_youtube(lesson_url)
    YouTube.post_video_info(self, lesson_url)
  end
  
  def convert_youtube_url_to_id
    return if youtube_url.blank? || youtube_id.present?
    self.youtube_id = youtube_url.gsub('http://youtu.be/', '')
  end
  
  def google_frame(width, height)
    youtube_id.gsub(/width=\"\d+\"/, "width=\"#{width}\"").gsub(/height=\"\d+\"/, "height=\"#{height}\" frameborder=\"0\", allowfullscreen=\"allowfullscreen\"")
  end

end
