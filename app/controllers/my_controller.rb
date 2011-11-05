class MyController < ApplicationController
  before_filter :authenticate_user!

  def lessons
    @lessons = current_user.lessons.recent
  end

end
