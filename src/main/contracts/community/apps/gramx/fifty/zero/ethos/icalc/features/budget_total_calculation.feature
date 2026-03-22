Feature: icalc
  # As a budget-conscious individual named Rachel Wong, I want to easily add multiple expenses without unnecessary steps so that I can keep track of my family's budget quickly.

  @EALC1003 @EAIC1006 @EAIC1007 @EAIC1008 @EAIC1009 @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1007 @EAIV1008 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIT1001 @EAIT1002
  Scenario: Budget Total Calculation
    Given I am on the Main Page of the ioscalc app
    When I enter my first expense '20'
    When I press the 'addition' button
    When I enter my second expense '15'
    When I press the 'addition' button
    When I enter my third expense '30'
    When I press the 'equals' button
    Then I should see '65' displayed as the total of my expenses
