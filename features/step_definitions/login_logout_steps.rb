require 'selenium-webdriver'

Given(/^I am on the Debtify page$/) do
  $driver.get "http://localhost:3000"
end

When(/^I press the (.+) button$/) do |button|
  login = button.split(/\s+/)
  button_element = login.join('_').to_sym
  $driver.find_element(:xpath, ".//a[@href='/users/#{button_element}']").click
end

When(/^I arrive to the (.*) page$/) do |name|
  if name.include?('Dashboard')
  	$driver.page_source.include?('successfully')
  elsif name.include?('main')
  	$driver.page_source.include?('Bills management as a Service')
  else
    uri = name.split(/\s+/)
    $driver.current_url.include?(uri.join('_'))
  end
end

When(/^I Sign up with random user and "([^"]*)" password$/) do |password|
  num =  Random.rand(100)
  user = "random#{num}" + '@test.test' 
  $driver.find_element(:id, "user_email").send_keys(user)
  $driver.find_element(:id, "user_password").send_keys(password)
  $driver.find_element(:id, "user_password_confirmation").send_keys(password)
  $driver.find_element(:xpath,"//input[@type='submit']").click
end

When(/^I Log in with "([^"]*)" and "([^"]*)" password$/) do |user, password|
  $driver.find_element(:id, "user_email").send_keys(user)
  $driver.find_element(:id, "user_password").send_keys(password)
  $driver.find_element(:xpath,"//input[@type='submit']").click
end

# Then(/^I am on Dashboard page$/) do
#   $driver.page_source.include?('successfully')
# end

# Then(/^I Log out$/) do
#   $driver.find_element(:xpath,"//a[@href='/users/sign_out']").click
# end

# Then(/^I am on main page$/) do
#   $driver.page_source.include?('Bills management as a Service')
# end
