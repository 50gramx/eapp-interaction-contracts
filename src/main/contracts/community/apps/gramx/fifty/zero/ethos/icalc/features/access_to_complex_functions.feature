Feature: icalc
  # As a Finance professional named Michael Smith, I want to perform percentage calculations seamlessly so that I can enhance my productivity in financial reporting.

  @EAIC1028 @EAIT1003 @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1004
  Scenario: Access to Complex Functions
    Given I am on the Main Page of the ioscalc app
    When I navigate to the 'Functions' menu
    When I select 'percentage' from the list
    When I enter '150' and select 'percentage of 20'
    When I press the 'equals' button
    Then I should see '30' displayed as the result
