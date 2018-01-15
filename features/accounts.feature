Feature: webapp - New user registration

  @user_registration @reg
  Scenario: Verify the new user registration functionality
    Given I visit the webapp landing page
    When I enter login name and password and repeat password
    And I click on create account button
   	Then I should see the user registration success message
