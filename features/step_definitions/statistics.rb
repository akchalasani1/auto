When("I click on the stats link") do
  on(LandingPage) do |page|
    page.stats_link_element.click
    sleep 2
  end
end

Then("page should be splitted horizontally into two parts") do 
  on(LandingPage) do |page|
    expect(page.upr_usr_stats_element.exists?).to be false
  end
end

Then("upper half displays user statistics") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("lower half  displays records statistics") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("exact contents of user statistics will be defined later") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("exact contents of records statistics will be defined later") do
  pending # Write code here that turns the phrase above into concrete actions
end
