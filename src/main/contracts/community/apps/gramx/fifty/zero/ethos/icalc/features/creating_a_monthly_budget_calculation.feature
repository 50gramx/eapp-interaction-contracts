Feature: ioscalc
  # As a casual user named Rachel Wong, I want to set a monthly budget and compare it to my actual spending so that I can manage my family’s finances more effectively.

  @EAIC1011 @EAIC1012 @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1003 @EAIC1005 @EAIT1001
  Scenario: Creating a Monthly Budget Calculation
    Given I am on the Main Page of the ioscalc app
    When I enter my monthly budget '200'
    When I subtract my total spending '150' using the 'subtraction' function
    Then I should see '50' displayed as the remaining budget
