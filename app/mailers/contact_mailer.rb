class ContactMailer < ActionMailer::Base

  default :from => "cristian.j.derr@gmail.com"
  default :to => "contextbeats@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Message from #{message.name} on CONTEXT")
  end

end
