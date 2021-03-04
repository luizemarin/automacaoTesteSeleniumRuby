Selenium::WebDriver::Chrome.driver_path="C:/chromedriver/chromedriver.exe"

Given('the access webpage') do
  @driver = Selenium::WebDriver.for :chrome
  @driver.get "https://the-internet.herokuapp.com/login"
  sleep 3
end

When('I do not inform username') do
  sleep 3
  @driver.find_element(:id, "username").click
end

When('I do not inform password') do
  sleep 3
  @driver.find_element(:id, "password").click
end

Then('the login is not performed') do
  sleep 3
  @driver.find_element(:xpath, "/html/body/div[2]/div/div/form/button").click
  @driver.find_element(:class, "flash error").text
end

When('I inform username') do
  sleep 3
  @driver.find_element(:id, "username").click
  sleep 3
  @driver.find_element(:id, "username").send_keys "tomsmith"
end

Then('the login is not performed invalidating password') do
  sleep 3
  @driver.find_element(:xpath, "/html/body/div[2]/div/div/form/button").click
  @driver.find_element(:class, "flash error").text
end

When('I inform password') do
  sleep 3
  @driver.find_element(:id, "password").click
  @driver.find_element(:id, "password").send_keys "SuperSecretPassword!"
end

Then('the login is not performed invalidating the user') do
  sleep 3
  @driver.find_element(:xpath, "/html/body/div[2]/div/div/form/button").click
  @driver.find_element(:class, "flash error").text
end

When('I inform Invalid username') do
  sleep 3
  @driver.find_element(:id, "username").click
  sleep 3
  @driver.find_element(:id, "username").send_keys "luizmarin"
end

When('I enter a username and password') do
  sleep 3
  @driver.find_element(:id, "username").click
  sleep 3
  @driver.find_element(:id, "username").send_keys "tomsmith"
  sleep 3
  @driver.find_element(:id, "password").click
  sleep 3
  @driver.find_element(:id, "password").send_keys "SuperSecretPassword!"
end

Then('login must be performed') do
  sleep 3
  @driver.find_element(:class, "flash success").text
  sleep 3
  @driver.find_element(:class, "button secondary radius").click
end