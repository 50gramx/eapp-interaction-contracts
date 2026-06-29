# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press Percentage to work so I can use calculator.

  @EALC1020 @EAIV1003
  Scenario: Press Percentage capability executes
    Given the calculator eApp is open
    When capability EALC1020 (Press Percentage) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
