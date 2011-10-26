class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

  scope :with_lesson, includes(:lesson)

  after_create :notify_lesson_owner


  private

  def notify_lesson_owner
    CommentMailer.notify_lesson_owner(id).deliver
  end

end
