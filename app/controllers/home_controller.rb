class HomeController < ApplicationController

  def index
    @lessons = Lesson.published.recent.limit(10)
  end

end
