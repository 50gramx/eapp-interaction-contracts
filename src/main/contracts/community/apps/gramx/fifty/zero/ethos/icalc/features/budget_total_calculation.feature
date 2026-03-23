Feature: icalc
  # As a Budget Manager named Rachel Wong, I want to quickly add up my family's expenses while shopping so that I can stay within budget.

  @EAIC1011 @EAIC1012 @EAIV1001 @EAIV1002 @EAIV1004 @EAIV1005 @EAIV1007 @EAIV1008 @EAIV1006 @EALC1003 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1006 @EAIC1004 @EAIC1008 @EAIT1001
  Scenario: Budget Total Calculation
    Given I am on the Main Page of the ioscalc app
    When I enter my first expense '20'
    When I press the 'addition' button
    When I enter my second expense '15'
    When I press the 'addition' button
    When I enter my third expense '30'
    When I press the 'equals' button
    Then I should see '65' displayed as the total of my expenses
