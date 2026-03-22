Feature: ioscalc
  # As a professional named Michael Smith, I want to easily access complex financial functions so that I can streamline my financial calculations for reports.

  @EAIC1006 @EAIC1007 @EAIV1001 @EAIV1002 @EAIV1006 @EAIV1003 @EAIV1005 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1004 @EAIT1001
  Scenario: Access to Complex Functions
    Given I am on the Main Page of the ioscalc app
    When I navigate to the 'Functions' menu
    When I select 'percentage' from the list
    When I enter '150' and select 'percentage of 20'
    When I press the 'equals' button
    Then I should see '30' displayed as the result
