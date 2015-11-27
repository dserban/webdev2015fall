require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get('http://localhost:3000/show_radio_buttons')

loop do
  sleep 0.5

  form = driver.find_element(:tag_name => 'form')
  labels = form.find_elements(:tag_name => 'label')
  option_to_pick = labels.sample
  picked_pl_name = option_to_pick.text
  option_to_pick.click

  sleep 0.5

  form.submit

  sleep 0.5

  app_pl_name =
    driver
      .find_element(:tag_name => 'p')
      .text
      .gsub(/^Your favorite programming language is /, '')

  expected_pl_name = picked_pl_name

  if app_pl_name != expected_pl_name
    raise "You picked " +
          "#{expected_pl_name}" +
          ", but the app says that you picked #{app_pl_name}"
  end

  link_to_go_back = driver.find_element(:tag_name => 'a')
  link_to_go_back.click
end

driver.quit
