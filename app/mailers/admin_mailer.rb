class AdminMailer < ActionMailer::Base

  default :from => "Upside Down Academy <support@upsidedownacademy.org>", :host => "upsidedownacademy.org"

  def notify(subject, message)
    mail(:to => 'jared@upsidedownacademy.org', :subject => subject) do |format|
      format.text { render :text => message.gsub(/#</, "") }
      format.html { render :text => message.gsub(/#</, "") }
    end
  end

end
