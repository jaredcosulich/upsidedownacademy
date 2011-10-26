class UserMailer < ActionMailer::Base

  default :from => "Upside Down Academy <support@upsidedownacademy.org>", :host => "upsidedownacademy.org"

  def welcome(id)
    @user = User.find(id)
    mail(:to => @user.email, :subject => "Welcome to Upside Down Academy")
  end

end
