##README

##Summary

This is a short description about how to run and develop tests for this app.
The tests were written in Cucumber with selenium-webdriver to be able to test the application with browsers.

##Start tests

1. Clone the application
2. cd to the directory
3. Bundle it with RAILS_ENV=develop or test
4. Start the application `rails s` (Don't forget your database!)
5. On terminal type `cucumber`

The default browser address is `http://localhost:3000`. If you want to change it, you can change it within the `features/step_definitions/login_logout_steps.rb` (I know it is a bad name) file's first step definition. (In the future it should be an environment variable in the env.rb)

The html test results - if you run the test with the default profile - will be in `features/html_reports` directory, if there were some failures, you can find the snapshots in the `features/screenshots` directory (if you ran the cucumber from the app's main directory)
If you want to see the full reports on the console, run the cucumber with console profile
```
cucumber -p console
```

You can add more profiles into the `config/cucumber.yml` file

*NOTE* Keep in mind that cucumber using selenium-webdriver and you need to be installed the browser you want to use for tests!

##Structure

It using the default structure what the Cucumber is required. 

* The `.feature` files contain the test scenarios.
* The `features/step_definitions` directory keeps the step definition files. (In the future need to rethink the step definition file's structure)
* As I mentioned earlier the `features/step_definitions/login_logout_steps.rb` first step holds the server configuration for now.
* You can find some environment settings in the `features/support/env.rb` file. This file also was preperd for mobile test platforms.
* The `features/support/hooks.rb` guarding the "Before/After" steps of the tests
* And finally - of course - this README.md contains some useful information about the test run

That's all for today!

