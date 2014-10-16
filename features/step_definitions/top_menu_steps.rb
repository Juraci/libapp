When /^I go to home page$/ do
  visit ""
end

Then /^I should see guest menu$/ do
  expect(page).to have_selector "#top-menu"
  expect(page).to have_link("Register", href: register_path)
end
