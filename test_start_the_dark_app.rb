require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get('http://localhost:3000/mainpage')

loop do
  signinforms = driver.find_elements(:class_name => 'signinform')
  randomly_picked_signin_form = signinforms.sample
  actual_signin_user_name =
    randomly_picked_signin_form
      .find_element(:tag_name => 'button')
      .text
      .gsub(/^As /, '')

  randomly_picked_signin_form.submit

  displayed_signin_user_name =
    driver
      .find_element(:id => 'signedinstatus')
      .text
      .gsub(/^Currently signed in as /, '')

  if displayed_signin_user_name != actual_signin_user_name
    raise "The top right-hand corner should display " +
          "#{actual_signin_user_name}" +
          " as the currently signed-in user name" +
          ", but instead it displays " +
          "#{displayed_signin_user_name}"
  end

  sleep 0.1

  activity_sections = driver.find_elements(:class_name => 'activitysection')
  randomly_picked_activity_section = activity_sections.sample

  activity_description =
    randomly_picked_activity_section
      .find_element(:class_name => 'activitydescription')

  choose_activity_form =
    randomly_picked_activity_section
      .find_element(:class_name => 'chooseactivityform')

  choose_activity_button_is_enabled =
    !choose_activity_form
      .find_element(:tag_name => 'button')
      .attribute('disabled')

  if choose_activity_button_is_enabled
    choose_activity_form.submit
  else
    activity_participants =
      randomly_picked_activity_section
        .find_element(:class_name => 'activityparticipants')
        .text
    if !activity_participants.include?(actual_signin_user_name)
      raise "#{actual_signin_user_name}" +
            " is not shown to participate in activity " +
            "#{activity_description}" +
            " as expected"
    end
  end

  signoutform = driver.find_element(:id => 'signoutform')
  signoutform.submit
end

driver.quit
