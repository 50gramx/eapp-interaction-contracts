Feature: mycalc
  # As a student named Emily Johnson, I want to quickly tap the numbers and operations on the Main Page so that I can calculate complex problems efficiently.

  @EAIV1001 @EAIV1002 @EALC1001 @EALC1002 @EALC1003 @EALC1004 @EAIP1001 @EAIC1001 @EAIC1002 @EAIC1003 @EAIC1004 @EAIC1005 @EAIT1001
  Scenario: Emily performs a basic calculation
    Given Emily is on the Main Page of mycalc
    When Emily taps '3'
    When Emily taps '+'
    When Emily taps '7'
    When Emily taps '='
    Then the result displayed should be '10'
