# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 2 to work so I can use calculator.

  @EALC1003 @EAIV1003
  Scenario: Press 2 capability executes
    Given the calculator eApp is open
    When capability EALC1003 (Press 2) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
