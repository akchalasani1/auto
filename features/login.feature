Feature: webapp - Users Login

  @user_login @reg
  Scenario: Verify user login functionality
    Given I visit the webapp landing page
    When I enter "user_name", "pwd" and click login
    Then I should see status bar with logout button
    And I should see the records log

#    @failure @reg
#    Scenario: Verify user login functionality
#      Given I visit the webapp landing page
#      When I enter invalid user login name and password
#      And I click on login button
#      Then I should see invalid user name and password message 
