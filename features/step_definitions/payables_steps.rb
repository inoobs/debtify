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
  $driver.find_element(:xpath, "//input[@id='payable_name']").send_keys(name)
  $driver.find_element(:xpath, "//textarea[@id='payable_description']").send_keys(description)
end

When(/^I type the amount (.*) and select the due on date to today$/) do |amount|
  date = Date.today
  $driver.find_element(:xpath, "//input[@id='payable_amount']").send_keys(amount)
  $driver.find_element(:xpath, "//input[@id='payable_due_on']").send_keys(date)
end

When(/^I select the recurring ends on date to "(\d+)\.(\d+)\.(\d+)"$/) do |year, month, day|
  date = "#{day}-#{month}-#{year}"
  $driver.find_element(:xpath, "//input[@id='payable_recurring_ends_on']").send_keys(date)
end

When(/^I select the recurring type to "([^"]*)"$/) do |type|
  $driver.find_element(:xpath, "//option[@value='#{type}']").click
end

Then(/^I click on the Manage payables button$/) do
  $driver.find_element(:xpath, "//a[@href='/payables']").click
  $driver.page_source.include?('Your bills')
end

Then(/^I find my new payable on "([^"]*)" page$/) do |name|
  $driver.page_source.include?(name)
end

Then(/^I press Save$/) do
  $driver.find_element(:xpath,"//button[@type='submit']").click
end

Then(/^I arrives back to Dashboard page$/) do
  $driver.page_source.include?('has been created successfully!')
end