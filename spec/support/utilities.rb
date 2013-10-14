def sign_in(user)
  visit signin_path
  fill_in "session_name", :with => user.name
  fill_in "session_password", :with => user.password
  click_button "Sign In"
  cookies[:remember_token] = user.remember_token
end