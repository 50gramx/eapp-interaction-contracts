# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 7 to work so I can use calculator.

  @EALC1008 @EAIV1003
  Scenario: Press 7 capability executes
    Given the calculator eApp is open
    When capability EALC1008 (Press 7) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
