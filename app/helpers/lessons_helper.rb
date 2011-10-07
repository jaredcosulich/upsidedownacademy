module LessonsHelper

  def lesson_creator(lesson)
    lesson.user.nil? ? "Anonymous" : lesson.user.display_name
  end

end
