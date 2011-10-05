class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_for_unclaimed_lessons

  private
  def check_for_unclaimed_lessons
    return true if cookies["unclaimed_lessons"].blank? || !user_signed_in?

    cookies["unclaimed_lessons"].split(",").each do |lesson_id|
      Lesson.find(lesson_id).update_attributes(:user => current_user)
    end

    cookies["unclaimed_lessons"] = nil
    return true
  end

end
