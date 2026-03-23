Feature: icalc
  # As a family manager named Rachel Wong, I want a user-friendly layout so that I can perform expense calculations effortlessly.

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EAIV1006 @EALC1001 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1009 @EAIC1013 @EAIC1014 @EAIC1015 @EAIT1001 @EAIT1002
  Scenario: User-friendly Layout for Family Budgeting
    Given I am on the Main Page of the ioscalc app
    When I observe the calculator's layout
    When I see the numbered buttons and basic functions grouped together
    Then I can handle expense calculations without confusion and easily track our family's budget.
