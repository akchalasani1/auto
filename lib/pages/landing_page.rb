
class LandingPage
  include PageObject

############ Page Objects ########################
  element           :login_name,            xpath: %Q{(//*[@class="gwt-TextBox"])[2]}
  element           :password   ,           xpath: %Q{(//*[@class="gwt-PasswordTextBox"])[2]}
  element           :repeat_password,       xpath: %Q{(//*[@class="gwt-PasswordTextBox"])[3]}
  element           :create_button,         xpath: %Q{//button[text() = "create account"]}
  element           :registration_success,  xpath: %Q{.//*[@class="gwt-Label GE44STGCD"]}

  element           :usr_login_name,            xpath: %Q{(//*[@class="gwt-TextBox"])[1]}
  element           :usr_password   ,           xpath: %Q{(//*[@class="gwt-PasswordTextBox"])[1]}
  element           :login_button,              xpath: %Q{//button[text() = "login"]}
  element           :txt_login_lbl,             xpath: %Q{//*[text() = "logged in as"]}
  element           :loggedin_user,             xpath: %Q{//*[text()="logged in as"]//following-sibling::td/div}
  element           :logout_button,             xpath: %Q{//button[text() = "logout"]}
  element           :logout_success,             xpath: %Q{//*[text() = "logged out successfully"]}

  
#  To get the row count
  elements           :delete_button,             xpath: %Q{//div//tbody//td/table/tbody/tr/td[4]/button}

  # This will work for both modify and delete success message
  element           :operation_success,             xpath: %Q{.//*[@class="gwt-Label GE44STGCE"]}
  
  
  element           :permission_deniod,             xpath: %Q{.//*[@class="gwt-Label GE44STGCD"]} 
  elements           :owner_names,              xpath: %Q{//table/tbody/tr/td/table/tbody/tr/td[2]/div}
  
  element           :login_success,             xpath: %Q{//*[text() = "welcome :)"]}
  element           :add_new_record_button,     xpath: %Q{//button[text() = "add new record"]}

   ## statistics ## 
  element           :stats_link,            xpath: %Q{//*[@class = "gwt-Hyperlink"]/a[text() = "stats"]}
  element           :horizontal_page,            xpath: %Q{}
  element           :upr_usr_stats,            xpath: %Q{//*[text() = "USER STATS UNDER CONSTRUCTION"]}
  element           :lwr_rcd_stats,            xpath: %Q{//*[text() = "RECORD STATS UNDER CONSTRUCTION"]}
  element           :usr_stats_exat_cont,            xpath: %Q{}
  element           :usr_rcds_exat_cont,            xpath: %Q{}

  def new_user_registration(new_user_name, pwd, re_pwd)
    self.login_name_element.when_present.send_keys new_user_name
    self.password_element.when_present.send_keys pwd
    self.repeat_password_element.when_present.send_keys re_pwd
  end 
  
  def user_login(user_name, user_pass)
    self.usr_login_name_element.when_present.send_keys user_name
    self.usr_password_element.when_present.send_keys user_pass
    self.login_button_element.when_present.click
  end
  
  def record_logs_count
    test = self.delete_button_elements.count
    return test
  end
  
  def set_new_record_content(index, content)
    @browser.find_element(:xpath, "(.//*[@class='gwt-TextBox'])[#{index}]").send_keys content
#    @browser.find_element(:xpath, ".//*[@data-qa-id='header-#{link_name}']").click
  end
  
  def click_on_save(index)
   @browser.find_element(:xpath, ".//div//tbody//td/table/tbody/tr[#{index}]/td[3]/button").click
 end
 
  def click_on_delete(index)
    @browser.find_element(:xpath, ".//div//tbody//td/table/tbody/tr[#{index}]/td[4]/button").click
  end
  
  def get_owner_col_details
   names=[]
   names = self.owner_names_elements.map{|e| e.text}
  end
  
  def click_logout
        self.logout_button_element.when_present.click
  end
  
end 

