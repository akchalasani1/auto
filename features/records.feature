Feature: webapp - records link verification

  @records_link @reg
  Scenario: Verify the create, update, delete a record functionality
    Given I visit the webapp records page
    And I click on add new record button
    Then I should see new record with content field empty to give name
    And I click on save button and verify record is saved
    And I click on the content field to modify
    Then click on save button to update
    And I click on delete button to remove a record

    @peers_reportees_permissions @reg
    Scenario: Verify view, update, delete record functionality for peers and reportees
      Given I visit the webapp records page as manager
      And I click on the content field of reportee to modify
      Then click on save button to update reportee record
      And verify my reportee record is updated
      When I click on delete button for reportee record
      Then I should see perimission denined
      And I click on the content field of peer to modify
      Then click on save button to update peer record
      And verify my peer record is not updated
      When I click on delete button for peer record
      Then I should see perimission denined
      
	@verify_reportee_new_record @reg     
	  Scenario: Verify that a new record created by reportee can be viewed by manager right away
	    Given I visit the webapp records page as manager
	    And I count number of records displayed for reportee
	    Then logout as manager
	    And I login as reportee and create a brand new record save it
	    And I logout as reportee
	    When I log back in as a manager my reportee record count should increase by one 
	    
      
