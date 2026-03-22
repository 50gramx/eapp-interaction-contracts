Feature: ioscalc
  # As a student named Emily Chen, I want to perform basic addition calculations so that I can quickly solve problems during my study sessions.

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIT1001
  Scenario: Basic Addition Calculation
    Given I am on the Main Page of the ioscalc app
    When I enter the first number '5'
    When I select the 'addition' function
    When I enter the second number '3'
    When I press the 'equals' button
    Then I should see '8' displayed as the result
