require 'selenium-webdriver'

Given(/^The "([^"]*)" user logged in with "([^"]*)" password and arrived to Dashboard page$/) do |user, password|
  $driver.get "http://localhost:3000"
  $driver.find_element(:xpath, "//a[@href='/users/sign_in']").click
  $driver.current_url.include?('sign_in')
  $driver.find_element(:id, "user_email").send_keys(user)
  $driver.find_element(:id, "user_password").send_keys(password)
  $driver.find_element(:xpath,"//input[@type='submit']").click

end

When(/^I click on the Manage payables button and arrive on it$/) do
  $driver.find_element(:xpath, "//a[@href='/payables']").click
  $driver.current_url.include?('payables')
end

When(/^I add a new payable with name "([^"]*)" and description "([^"]*)"$/) do |name, description|
  $driver.find_element(:xpath, "//a[@href='/payables/new']").click
  $driver.find_element(:id, "payable_name").send_keys(name)
  $driver.find_element(:id, "payable_description").send_keys(description)
end

When(/^I type the amount "([^"]*)" and select the "Due on" date  \((\d+)\.(\d+)\.(\d+)\)$/) do |amount, year, month, day|
  date = "#{day}-#{month}-#{year}"
  $driver.find_element(:id, "payable_amount").send_keys(amount)
  $driver.find_element(:id, "payable_due_on").send_keys(date)
end

When(/^I select the "Recurring ends on" date to "(\d+)\.(\d+)\.(\d+)"$/) do |year, month, day|
  date = "#{day}-#{month}-#{year}"
  $driver.find_element(:id, "payable_recurring_ends_on").send_keys(date)
end

When(/^I select the "Recurring type" to "([^"]*)"$/) do |type|
  select = $driver.find_element(:id, "payable_recurring_type")
  select.select_by(:text, type)
end

Then(/^I click on the Manage payables button$/) do
  $driver.find_element(:xpath, "//a[@href='/payables']").click
  $driver.page_source.include?('Your bills')
end

Then(/^I find my new payable on "([^"]*)" page$/) do |arg1|
  $driver.page_source.include?(name)
end

Then(/^I press the Save button$/) do
  $driver.find_element(:xpath,"//input[@type='submit']").click
end