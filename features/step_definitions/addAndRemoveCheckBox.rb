Selenium::WebDriver::Chrome.driver_path="C:/chromedriver/chromedriver.exe"

Given('the access to the webpage') do
  @driver = Selenium::WebDriver.for :chrome
  @driver.get "https://the-internet.herokuapp.com/dynamic_controls"
  sleep 3
end

When('I remove the checkbox') do
  @driver.find_element(:xpath, "/html/body/div[2]/div/div[1]/form[1]/button").click
end

Then('the checkbox should no applied to the screen') do
  @driver.find_element(:id, "loading").text
end

When('I remove checkbox') do
  @driver.find_element(:xpath, "/html/body/div[2]/div/div[1]/form[1]/button").click
  sleep 3
end

When('add checkbox again') do
  @driver.find_element(:xpath, "/html/body/div[2]/div/div[1]/form[1]/button").click
  sleep 3
end

Then('the checkbox should be applied to the screen again') do
  @driver.find_element(:id, "message").text
  @driver.find_element(:xpath, "/html/body/div[2]/div/div[1]/form[1]/div[1]/input").click
end