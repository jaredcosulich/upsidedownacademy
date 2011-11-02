class LessonLink < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :linked_lesson, :class_name => "Lesson"

  scope :previous, where("next_lesson = 'f'")
  scope :next, where("next_lesson = 't'")
  scope :with_linked_lesson, includes(:linked_lesson)

end
