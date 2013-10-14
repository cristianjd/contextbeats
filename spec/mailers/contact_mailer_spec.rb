require 'spec_helper'

describe ContactMailer do
  let!(:message) { Message.new(:name => 'example', :email => 'example@example.com',
                              :subject => 'example', :body => 'Lorem Ipsum') }
  let!(:mail) { ContactMailer.new_message(message) }

  subject { mail }

  its(:to) { should eq(['contextbeats@gmail.com']) }
  its(:from) { should eq(['cristian.j.derr@gmail.com']) }
  its(:subject) { should eq('Message from example on CONTEXT') }
  its(:body) { should eq("You have recieved a new message from example regarding example:\n\nLorem Ipsum\n\nReply To: example@example.com")}
end