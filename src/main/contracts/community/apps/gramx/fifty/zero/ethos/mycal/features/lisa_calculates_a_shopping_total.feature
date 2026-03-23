Feature: mycal
  # As a busy mom named Lisa Carter, I want to calculate my shopping totals quickly so that I can manage my budget while shopping.

  @EAIV1001 @EAIV1002 @EAIV1003 @EAIV1004 @EAIV1005 @EALC1001 @EALC1002 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIT1001 @EAIP1001
  Scenario: Lisa calculates a shopping total
    Given Lisa is on the Main Page of mycal
    When Lisa taps '5'
    When Lisa taps '+'
    When Lisa taps '2'
    When Lisa taps '='
    Then the result displayed should be '7'
