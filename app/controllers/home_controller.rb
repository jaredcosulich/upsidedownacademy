class HomeController < ApplicationController

  def index
    @lessons = Lesson.recent.limit(10)
  end

end
