Feature: icalc
  # As a User, I want to User-friendly Layout for Family Budgeting so that 

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1011 @EAIC1003 @EAIC1012 @EAIT1001 @EAIT1002
  Scenario: User-friendly Layout for Family Budgeting
    Given I am on the Main Page of the ioscalc app
    When I observe the calculator's layout
    When I see the numbered buttons and basic functions grouped together
    Then I can handle expense calculations without confusion
