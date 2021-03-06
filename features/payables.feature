@payables

Feature: This tests checks the payable functionality
		Adding new payables, managing payables and so on

		Scenario: Adding new recurring payable
			Given The "test@test.test" user logged in with "testtesttest" password and arrived to Dashboard page
			When I click on the Manage payables button and arrive on it
			And I add a new payable with name "first" and description "first payment"
			And I type the amount "300" and select the due on date to today
			And I select the recurring type to "monthly"
			And I select the recurring ends on date to "03.09.2022"
			Then I press Save
			And I arrives back to Dashboard page
			And I click on the Manage payables button
			And I find my new payable on "payables" page

		Scenario: Adding new, not recurring payable
			Given The "test@test.test" user logged in with "testtesttest" password and arrived to Dashboard page
			When I click on the Manage payables button
			And I arrive to the payables page
			And I add a new payable with name "second" and description "second payment"
			And I type the amount "400" and select the due on date to today
			Then I press Save
			And I arrives back to Dashboard page
			And I click on the Manage payables button
			And I find my new payable on "payables" page