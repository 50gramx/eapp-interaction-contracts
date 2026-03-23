Feature: mycalc
  # As a casual user named Lisa Carter, I want to quickly add up my grocery expenses on the Main Page so that I can manage my budget easily while shopping.

  @EAIV1001 @EAIV1002 @EALC1001 @EALC1002 @EALC1003 @EALC1004 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIT1001
  Scenario: Lisa calculates a shopping total
    Given Lisa is on the Main Page of mycalc
    When Lisa taps '5'
    When Lisa taps '+'
    When Lisa taps '2'
    When Lisa taps '='
    Then the result displayed should be '7'
