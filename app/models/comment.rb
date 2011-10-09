class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

  scope :with_lesson, includes(:lesson)

end
