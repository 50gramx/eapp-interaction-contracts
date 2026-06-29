# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 9 to work so I can use calculator.

  @EALC1010 @EAIV1003
  Scenario: Press 9 capability executes
    Given the calculator eApp is open
    When capability EALC1010 (Press 9) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
