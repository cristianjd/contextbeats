class ContactMailer < ActionMailer::Base

  default :from => ENV['GMAIL_USER_NAME']
  default :to => ENV['GMAIL_USER_NAME']

  def new_message(message)
    @message = message
    mail(:subject => "Message from #{message.name} on CONTEXT")
  end

end
