Feature: ioscalc
  # As a casual user named Rachel Wong, I want to quickly add up my household expenses while shopping so that I can stay within my budget.

  @EAIV1007 @EAIV1008 @EAIC1008 @EAIC1009 @EAIC1010 @EAIV1001 @EAIV1002 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1004 @EAIC1005 @EAIT1001
  Scenario: Budget Total Calculation
    Given I am on the Main Page of the ioscalc app
    When I enter the first expense '20'
    When I press the 'addition' button
    When I enter the second expense '15'
    When I press the 'addition' button
    When I enter the third expense '30'
    When I press the 'equals' button
    Then I should see '65' displayed as the total of my expenses
