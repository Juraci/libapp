Given /^I am a guest$/ do
end

When /^I fill the register form with valid data$/ do
  @valid_email = "reader01@email.com"
  visit "/register"
  fill_in "reader_email", with: @valid_email
  fill_in "reader_password", with: "pass32"
  fill_in "reader_password_confirmation", with: "pass32"
  click_button "Register"
end

Then /^I should be registered in application$/ do
  expect(Reader.find_by_email("reader01@email.com")).to_not be_nil
end

Then /^I should be logged in$/ do
  expect(page).to have_content("Welcome, #{@valid_email}")
end

When(/^I fill the register form with invalid data$/) do
  @invalid_email = "reader"
  visit "/register"
  fill_in "reader_email", with: @invalid_email
  fill_in "reader_password", with: "pass32"
  fill_in "reader_password_confirmation", with: "pass"
  click_button "Register"
end

Then(/^I should see the register form again$/) do
  expect(page).to have_selector("form#new_reader")
end

Then(/^I should not be registered in application$/) do
  expect(Reader.find_by_email(@invalid_email)).to be_nil
end
