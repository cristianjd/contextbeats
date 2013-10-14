require 'spec_helper'

describe "ContactPages", :js => true do

  subject { page }

  before(:all) { ActionMailer::Base.deliveries = [] }

  before do
    visit root_path
    click_on 'Contact'
  end

  describe "name blank" do
    before { click_on 'Send' }
    it "should generate correct error" do
      find('#errors').should have_content('Name can not be blank.')
    end
    no_email_sent
  end

  describe "email blank" do
    before do
      fill_in 'message_name', :with => 'example'
      click_on 'Send'
    end
    it "should generate correct error" do
      find('#errors').should have_content('Email can not be blank.')
    end
    no_email_sent
  end

  describe "email invalid" do
    before do
      fill_in 'message_name', :with => 'example'
      fill_in 'message_email', :with => 'example'
      click_on 'Send'
    end
    it "should generate correct error" do
      find('#errors').should have_content('Invalid email.')
    end
    no_email_sent
  end

  describe "blank subject" do
    before do
      fill_in 'message_name', :with => 'example'
      fill_in 'message_email', :with => 'example@example.com'
      click_on 'Send'
    end
    it "should generate correct error" do
      find('#errors').should have_content('Subject can not be blank.')
    end
    no_email_sent
  end

  describe "blank body" do
    before do
      fill_in 'message_name', :with => 'example'
      fill_in 'message_email', :with => 'example@example.com'
      fill_in 'message_subject', :with => 'example'
      click_on 'Send'
    end
    it "should generate correct error" do
      find('#errors').should have_content('Message can not be blank.')
    end
    no_email_sent
  end

  describe "valid" do
    after(:all) { ActionMailer::Base.deliveries = [] }
    before do
      fill_in 'message_name', :with => 'example'
      fill_in 'message_email', :with => 'example@example.com'
      fill_in 'message_subject', :with => 'example'
      fill_in 'message_body', :with => 'Lorem Ipsum'
      click_on 'Send'
    end
    it "should say message sent" do
      sleep 10
      find('#errors').should have_content('Message sent!')
    end
    it "should reset all fields" do
      sleep 10
      find_field('message_name').value.should == ''
      find_field('message_email').value.should == ''
      find_field('message_subject').value.should == ''
      find_field('message_body').value.should == ''
    end
    it "should sent email" do
      ActionMailer::Base.deliveries.last.subject.should eq('Message from example on CONTEXT')
    end
  end

end
