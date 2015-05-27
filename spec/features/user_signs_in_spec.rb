feature "User signs in" do

  before do
    pending
    visit "/"
    click_on "Sign In"
  end

  scenario "Returning customer signs in" do
    user = Fabricate(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: "this is a password"
    click_button "Sign In"
    page.should have_content("Welcome back")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
    # Smoke testing Sign Out:
    click_on "Sign Out"
    page.should have_content("You have been signed out")
    page.should have_content("Sign In")
    page.should_not have_content("Sign Out")
  end

  scenario "Returning user attempts signin with incorrect password" do
    user = Fabricate(:user)
    page.should_not have_content("Sign Up")
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Sign In"
    page.should_not have_content("Sign Up")
    page.should have_error_message("We could not sign you in. Please check your email/password and try again.")
    page.should_not have_content("Create your account")
    page.should_not have_content("Password confirmation")
    fill_in "Password", with: "this is a password"
    click_button "Sign In"
    page.should have_content("Welcome back")
  end

  scenario "User signs in with wrong email" do
    Fabricate(:user, email: "susie@example.com", password: "ThisIsAwesome")
    within("form#user_session") do
      fill_in "Email", with: "joe@example.com"
      fill_in("Password", with: "ThisIsAwesome")
      click_on "Sign In"
    end
    page.should have_error_message("We could not sign you in. Please check your email/password and try again.")
  end

  scenario "User signs in with blanks" do
    within("form#user_session") do
      click_on "Sign In"
    end
    page.should have_error_message("We could not sign you in. Please check your email/password and try again.")
  end
end
