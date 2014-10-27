When /^I go to home page$/ do
  visit ""
end

Then /^I should see guest menu$/ do
  expect(page).to have_selector "#top-menu"
  expect(page).to have_link("Register", href: register_path)
end

Given /^I am a "(.*?)" reader$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" reader menu$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
