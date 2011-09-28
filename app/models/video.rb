class Video < ActiveRecord::Base
  belongs_to :lesson

  def setup_youtube(lesson_url)
    YouTube.post_video_info(lesson, lesson_url)
  end
  

end
