require 'selenium-webdriver'
require 'watir'
require 'page-object'


Before do|scenario|
  puts "The scenario that is currently running is " + scenario.name.to_s
end

After do|scenario|
  take_screenshot(scenario) if scenario.failed?
  begin
    @browser.quit
  rescue
  end
end


############# reusable definition to take screen shot and attach it to the .html report ############
private
#def take_screenshot(scenario)
#  scenario_name = "#{scenario.name}_step"
#  sshot_name = "./log/screens/" + scenario_name +".png"
#  @browser.driver.save_screenshot(sshot_name)
#  embed(sshot_name, "image/png")
##  @browser.save_screenshot(sshot_name) rescue nil
##  embed(sshot_name, 'image/png', 'Failed_scenario') rescue nil
#end

def take_screenshot(scenario)
  scenario_name = "#{scenario.name}_step"
  sshot_name = "log/screens/" + scenario_name +".png"
  @browser.screenshot.save(sshot_name) rescue nil
  embed(sshot_name, 'image/png') rescue nil
end

