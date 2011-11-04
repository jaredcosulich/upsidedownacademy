class LessonLink < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :linked_lesson, :class_name => "Lesson"

  scope :previous, where("next_lesson = 'f'")
  scope :next, where("next_lesson = 't'")
  scope :with_published_linked_lesson, includes(:linked_lesson).where("lessons.published_at is not null")

  attr_accessor :back_link

  after_save :create_back_link

  private

  def create_back_link
    if back_link &&
      linked_lesson.user_id == lesson.user_id &&
      LessonLink.where("lesson_id = ? AND linked_lesson_id = ?", linked_lesson_id, lesson_id).count == 0
      linked_lesson.lesson_links.create(:linked_lesson => lesson, :next_lesson => !next_lesson)  
    end
  end

end
