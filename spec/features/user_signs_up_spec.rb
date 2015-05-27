feature "User Signs Up" do

  background do
    pending
    visit root_path
    click_on "Sign Up"
  end

  scenario "Happy Path" do
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_content("Welcome, joe@example.com")
  end

  scenario "Error Path" do
    fill_in "Email", with: "joeexample.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "food"
    click_on "Sign Up"
    page.should have_error_message("Please fix the errors below to continue.")
    page.should have_error("must be an email address", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_content("Welcome, joe@example.com")
  end

  scenario "Already registered" do
    Fabricate(:user, email: "susie@example.com", password: "ThisIsAwesome")
    fill_in "Email", with: "susie@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_error_message("You already have an account. Please sign in.")
    field_labeled("Email").value.should == "susie@example.com"
    fill_in("Password", with: "ThisIsAwesome")
    click_on "Sign In"
    page.should have_content("Welcome, joe@example.com")
  end
end
