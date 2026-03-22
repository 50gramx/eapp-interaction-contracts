Feature: icalc
  # As a family budget manager named Rachel Wong, I want to be able to compare scheduled budgets to actual spending quickly so that I can manage our finances effectively.

  @EAIV1001 @EAIV1002 @EAIV1004 @EAIV1005 @EAIV1003 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1011 @EAIC1012 @EAIC1005 @EAIT1001
  Scenario: Schedule Budgets Comparison
    Given I am on the Main Page of the ioscalc app
    When I enter my scheduled monthly budget '200'
    When I enter my actual spending '150'
    When I press the 'subtract' button
    Then I should see '50' displayed as the remaining budget
