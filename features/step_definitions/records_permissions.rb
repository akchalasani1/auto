Given("I visit the webapp records page") do
  steps %{
    Given I visit the webapp landing page
    When I enter "user_name", "pwd" and click login
  }
end

Given("I click on add new record button") do
  on(LandingPage) do |page|
    @log_count_before = page.record_logs_count
    puts"log_count_before:#{@log_count_before}"
    page.add_new_record_button_element.click
  end
end

Then("I should see new record with content field empty to give name") do
  on(LandingPage) do |page|
    @log_count_after = page.record_logs_count
    expect(@log_count_before.to_i < @log_count_after.to_i).to be true
    @actual_index = (@log_count_after.to_i + 1)
    puts"index:#{@actual_index}"    
    page.set_new_record_content(@actual_index, "New User -#{@actual_index}")
  end
end

Then("I click on save button and verify record is saved") do
  on(LandingPage) do |page|
    sleep 2
    page.click_on_save(@actual_index)
    sleep 4
    puts"page.operation_success_element.text.to_s:#{page.operation_success_element.text.to_s}"
    expect(page.operation_success_element.text.to_s == "record saved").to be true
    expect(@log_count_before.to_i < @log_count_after.to_i).to be true
  end
end

Then("I click on the content field to modify") do
  on(LandingPage) do |page|
    page.set_new_record_content(@actual_index, "Test User -#{@actual_index}")
    sleep 2
  end
end

Then("click on save button to update") do
  on(LandingPage) do |page|
    page.click_on_save(@actual_index)
    sleep 4
    expect(page.operation_success_element.text.to_s == "record saved").to be true
    sleep 2
  end
end

Then("I click on delete button to remove a record") do
  on(LandingPage) do |page|
    page.click_on_delete(@actual_index)
    sleep 4
    expect(page.operation_success_element.text.to_s == "record deleted").to be true
    expect(@log_count_before.to_i == (page.record_logs_count).to_i).to be true
  end
end

## 

Given("I visit the webapp records page as manager") do
  step "I visit the webapp landing page"  
    on(LandingPage)do |page|
#      puts "$admin_user_name: #{$admin_user_name}"
#      puts "$admin_pwd: #{$admin_pwd}"
      page.user_login($admin_user_name, $admin_pwd)
    end
end

Given("I click on the content field of reportee to modify") do
  on(LandingPage)do |page|
    sleep 2
    names = page.get_owner_col_details
    puts"names:#{names}"
    index = names.index($reportee_usr_name2)
    @reportee_index = index.to_i+1
    puts"reportee_index:#{@reportee_index}"
    page.set_new_record_content(@reportee_index, "Test_Reportee-#{@reportee_index}")
  end
end

 Then("click on save button to update reportee record") do
   on(LandingPage) do |page|
     sleep 2
     page.click_on_save(@reportee_index)
   end
 end

Then("verify my reportee record is updated") do
  on(LandingPage) do |page|
    sleep 2
    expect(page.operation_success_element.text.to_s == "record saved").to be true
  end  
end

 When("I click on delete button for reportee record") do
   on(LandingPage) do |page|
     sleep 2
    
     page.click_on_delete(@reportee_index)
   end
 end

Then("I should see perimission denined") do
  on(LandingPage) do |page|
    sleep 2
    puts"page.permission_deniod_element.text.to_s:#{page.permission_deniod_element.text.to_s}"
    expect(page.permission_deniod_element.text.to_s == "permission denied").to be true
  end
end

Then("I click on the content field of peer to modify") do
  on(LandingPage)do |page|
    names = page.get_owner_col_details
    puts"names:#{names}"
    index = names.index($peer_user_name)
    @peer_index = index.to_i+1
    puts"peer_index:#{@peer_index}"
    page.set_new_record_content(@peer_index, "Test_Peer-#{@peer_index}")
  end
end

Then("click on save button to update peer record") do
  on(LandingPage) do |page|
    page.click_on_save(@peer_index)
  end
end

Then("verify my peer record is not updated") do
  on(LandingPage) do |page|
    sleep 2
    expect(page.permission_deniod_element.text.to_s == "permission denied").to be true
    #expect(page.operation_success_element.text.to_s == "record saved").to be true
  end  
end
 
Then("I click on delete button for peer record") do
  on(LandingPage) do |page|
    page.click_on_delete(@peer_index)
  end
end

##

Given("I count number of records displayed for reportee") do
   on(LandingPage)do |page|
    sleep 2
    names = page.get_owner_col_details
    #puts"names:#{names}"
     @reportee_count_before = names.count("xing")
     puts"reportee_count_before:#{@reportee_count_before}"
     
  end 
end

Then("logout as manager") do
  on(LandingPage) do |page|
    sleep 1
    page.click_logout
    sleep 1
    expect(page.logout_success_element.text.to_s == "logged out successfully").to be true
  end 

end

Then("I login as reportee and create a brand new record save it") do
  on(LandingPage)do |page|
    puts "$reportee_usr_name2: #{$reportee_usr_name2}"
    puts "$reportee_pwd2: #{$reportee_pwd2}"
    page.refresh
    sleep 2
    page.user_login($reportee_usr_name2, $reportee_pwd2)
    sleep 2
    expect(page.login_success_element.text.to_s == "welcome :)").to be true
    
    @log_count_before = page.record_logs_count
    #puts"log_count_before:#{@log_count_before}"
    page.add_new_record_button_element.click
    
    @log_count_after = page.record_logs_count
    #expect(@log_count_before.to_i < @log_count_after.to_i).to be true
    @actual_index = (@log_count_after.to_i + 1)
    #puts"index:#{@actual_index}"    
    page.set_new_record_content(@actual_index, "New User -#{@actual_index}")
    sleep 1
    
    sleep 2
    page.click_on_save(@actual_index)
    sleep 4
    #puts"page.operation_success_element.text.to_s:#{page.operation_success_element.text.to_s}"
    expect(page.operation_success_element.text.to_s == "record saved").to be true
    expect(@log_count_before.to_i < @log_count_after.to_i).to be true
  end 
end

Then("I logout as reportee") do
    on(LandingPage) do |page|
    sleep 1
    page.click_logout
    sleep 1
    expect(page.logout_success_element.text.to_s == "logged out successfully").to be true
    page.refresh
  end 
end

When("I log back in as a manager my reportee record count should increase by one ") do
    on(LandingPage)do |page|
#      puts "$admin_user_name: #{$admin_user_name}"
#      puts "$admin_pwd: #{$admin_pwd}"
      page.user_login($admin_user_name, $admin_pwd)
     
     sleep 2
     names = page.get_owner_col_details
     #puts"names:#{names}"
     @reportee_count_after = names.count("xing")        
     puts"reportee_count_after:#{@reportee_count_after}"
     
     expect(@log_count_before.to_i < @log_count_after.to_i).to be true
     puts "New record created by xing, is updated and seen in managers account"
    end
end