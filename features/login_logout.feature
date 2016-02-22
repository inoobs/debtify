@login

Feature: Login and logout to and from the webside
		This test sign up, login and logout as a user of the Debtify

		Scenario: Sign up as a new user
			Given I am on the Debtify page
			When I press the sign up button
			And I arrive to the sign up page
			And I Sign up with random user and "SuperS3cureP@ssword" password
			Then I arrive to the Dashboard page
			And I press the sign out button
			And I arrive to the main page

		Scenario: Log in as a new user
			Given I am on the Debtify page
			When I press the sign in button
			And I arrive to the sign in page
			And I Log in with "random@test.test" and "SuperS3cureP@ssword" password
			Then I arrive to the Dashboard page
			And I press the sign out button
			And I arrive to the main page
