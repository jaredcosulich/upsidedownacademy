module LessonsHelper

  def lesson_owner(lesson)
    lesson.user.nil? ? "Anonymous" : lesson.user.display_name
  end

  def lesson_owner?(lesson)
    (lesson.user == current_user && user_signed_in?) ||
    !(cookies["unclaimed_lessons"] || "").split(",").index(lesson.id.to_s).nil?
  end

end
