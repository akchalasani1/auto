Feature: webapp - statistics link verification

  @statistics_link @reg
  Scenario: Verify the statistics page functionality
	Given I visit the webapp landing page
	When I enter "user_name", "pwd" and click login
	And I click on the stats link
    Then page should be splitted horizontally into two parts 
    And upper half displays user statistics
    Then lower half  displays records statistics
    When exact contents of user statistics will be defined later
    And exact contents of records statistics will be defined later
    

 
