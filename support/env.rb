require 'selenium-webdriver'
require 'page-object'
require 'require_all'
require 'yaml'
require 'rspec'
require 'watir'


def on(class_name)
  yield class_name.new(@browser)
end

####### To Load all the libraries #################
require_all './lib'
require_all './support'

##############Sign Up######################

path = File.join __dir__, '../config/users.yml'
user_details = YAML.load(File.open(path))
  
#New User Registration
$new_user_name = uremail = user_details["sign_up"]["user_name"]
$new_pwd = user_details["sign_up"]["pwd"]
$new_cnfm_password = user_details["sign_up"]["cnfm_pwd"]

  
#Admin Credentials
$admin_user_name = uremail = user_details["admin_login"]["user_name"]
$admin_pwd = user_details["admin_login"]["password"]
  
#Peer Credentials
$peer_user_name = uremail = user_details["peers_login"]["user_name"]
$peer_pwd = user_details["peers_login"]["password"]
  
#Reportees Credentials  
$reportee_usr_name1 = uremail = user_details["reportees_login"]["user_name1"]
$reportee_pwd1 = user_details["reportees_login"]["password1"]
  
$reportee_usr_name2 = uremail = user_details["reportees_login"]["user_name2"]
$reportee_pwd2 = user_details["reportees_login"]["password2"]





path = File.join __dir__, '../config/test_data/test_data.yml'
product_details = YAML.load(File.open(path))

$product_name = product_details["product_details"]["product_name"]

URL = {     'production' => "http://ec2-54-210-168-91.compute-1.amazonaws.com:8666/recruitment/records"
             # 'qa' => "http://ec2-54-210-168-91.compute-1.amazonaws.com:8666/recruitment/records"
}

def app_invoke
  case ENV['BROWSER']
    when 'firefox'
      @browser = Selenium::WebDriver.for :firefox
      # @browser.cookies.clear
#       @browser.manage.window.maximize
    when 'chrome'
      @browser = Selenium::WebDriver.for :chrome
      # @browser.cookies.clear
#      @browser.manage.window.maximize
    else
      @browser = Selenium::WebDriver.for :chrome
      # @browser.cookies.clear
#      @browser.manage.window.maximize
  end

  if ENV['URL'] == 'prod'
    app_url = URL['production']
  else
    app_url = URL['qa']
  end

  puts"app_url:#{app_url}"
  @browser.navigate.to app_url
end
