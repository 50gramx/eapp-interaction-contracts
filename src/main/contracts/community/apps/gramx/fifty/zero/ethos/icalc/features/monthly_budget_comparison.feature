Feature: icalc
  # As a family manager named Rachel Wong, I want to compare my scheduled budget to actual spending so that I can track our financial status effectively.

  @EALC1007 @EALC1008 @EAIV1006 @EAIV1002 @EAIV1005 @EALC1004 @EAIP1001 @EAIC1011 @EAIC1012 @EAIC1013 @EAIC1005 @EAIT1001
  Scenario: Monthly Budget Comparison
    Given I am on the Main Page of the ioscalc app
    When I enter my scheduled monthly budget '200'
    When I enter my actual spending '150'
    When I press the 'subtract' button
    Then I should see '50' displayed as the remaining budget
