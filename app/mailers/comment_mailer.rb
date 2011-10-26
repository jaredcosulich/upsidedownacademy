class CommentMailer < ActionMailer::Base

  default :from => "Upside Down Academy <support@upsidedownacademy.org>", :host => "upsidedownacademy.org"

  def notify_lesson_owner(comment_id)
    @comment = Comment.includes({:lesson => :user}, :user).find(comment_id)
    @lesson = @comment.lesson
    @author = @comment.user
    mail(:to => @lesson.user.email, :subject => "Someone has posted a comment on one of your lessons.")
  end

end
