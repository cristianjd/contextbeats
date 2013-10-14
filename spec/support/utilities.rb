def sign_in(user)
  visit signin_path
  fill_in "session_name", :with => user.name
  fill_in "session_password", :with => user.password
  click_button "Sign In"
  cookies[:remember_token] = user.remember_token
end

def no_email_sent
  it "should not send email" do
    expect(ActionMailer::Base.deliveries).to be_empty
  end
end