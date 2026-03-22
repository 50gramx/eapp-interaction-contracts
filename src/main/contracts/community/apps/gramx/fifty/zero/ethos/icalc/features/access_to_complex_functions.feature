Feature: icalc
  # As a finance professional named Michael Smith, I want to quickly use the percentage function without navigating through complex menus so that I can calculate financial figures efficiently.

  @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIT1001
  Scenario: Access to Complex Functions
    Given I am on the Main Page of the ioscalc app
    When I look for a quick access button for 'percentage'
    When I enter '150' and select 'percentage of 20'
    When I press the 'equals' button
    Then I should see '30' displayed as the result
