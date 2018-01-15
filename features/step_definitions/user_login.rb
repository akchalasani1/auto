When(/^I enter "([^"]*)", "([^"]*)" and click login$/) do |user_name, pwd|
  on(LandingPage)do |page|
    puts "$reportee_usr_name1: #{$reportee_usr_name1}"
    puts "$reportee_pwd1: #{$reportee_pwd1}"
    page.user_login($reportee_usr_name1, $reportee_pwd1)
    sleep 2
    expect(page.login_success_element.text.to_s == "welcome :)").to be true
  end
end

Then("I should see status bar with logout button") do
   on(LandingPage)do |page|
   expect(page.logout_button_element.exists?).to be true
   expect(($reportee_usr_name1.to_s == page.loggedin_user_element.text.to_s)).to be_truthy
#   if (@username.to_s == page.loggedin_user_element.text.to_s)
#     puts "logged-in: #{@username} matches with #{page.loggedin_user_element.text}"
#   else
#      puts "logged-in: #{@username} Does_NOT_Match with #{page.loggedin_user_element.text}"
#   end
  end
end

Then("I should see the records log") do
 on(LandingPage)do |page|
   puts "record_logs_count: #{page.record_logs_count}"
   expect(page.record_logs_count.to_i > 1).to be_truthy
 end
# puts "record_logs_count: #{page.record_logs_count}"
#     if (page.record_logs_count.to_i > 1)
#       puts "Number of record logs: #{page.rcd_logs_element.count}"
#     else
#       puts "NO record logs found: #{page.rcd_logs_element.count}"
#     end 
#  end
end 