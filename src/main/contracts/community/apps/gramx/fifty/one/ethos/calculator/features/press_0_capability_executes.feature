# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 0 to work so I can use calculator.

  @EALC1001 @EAIV1003
  Scenario: Press 0 capability executes
    Given the calculator eApp is open
    When capability EALC1001 (Press 0) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
