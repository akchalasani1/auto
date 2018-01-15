Given(/^I visit the webapp landing page$/) do
  app_invoke
  expect(@browser.current_url).eql? "http://ec2-54-210-168-91.compute-1.amazonaws.com:8666/recruitment/records"
end

When(/^I enter login name and password and repeat password$/) do
  on(LandingPage)do |page|
    page.new_user_registration($new_user_name,$new_pwd,$new_cnfm_password)
  end
end


When(/^I click on create account button$/) do
  on(LandingPage)do |page|
    page.create_button_element.click
  end
end


Then(/^I should see the user registration success message$/) do
  on(LandingPage)do |page|
    expect(page.registration_success_element.text == "server error").to be false
  end
end
