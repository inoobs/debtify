#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle
require 'selenium-webdriver'

Before do
  # Do something before each scenario.
  begin
    $driver = Selenium::WebDriver.for(:"#{$browser_type}")
    # $driver.manage().window().maximize()
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do
  $driver.close
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  #Create a directory for storing snapshot
  dir_path = "./features/screenshots"
  unless Dir.exist?(dir_path)
    Dir.mkdir(dir_path,0777)
    puts "=========Directory is created at #{dir_path}"
  end

  if(scenario.failed?)
    time = Time.now.strftime('%Y_%m_%d_%H_%M_%S_')
    name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
    puts "Name of snapshot is #{name_of_scenario}"
    file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
    puts file_path
    $driver.save_screenshot(file_path)
    puts "Snapshot is taken"
    puts "#===========================================================#"
    puts "Scenario:: #{scenario.name}"
    puts "#===========================================================#"
    
  end

  $driver.close
end

#Tagged hooks

Before('@Ex_tag1, @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @cucumis OR @sativus.
end

AfterStep('@Ex_tag1, @Ex_tag2') do
  # This will only run after steps within scenarios tagged
  # with @cucumis AND @sativus.
end