# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 5 to work so I can use calculator.

  @EALC1006 @EAIV1003
  Scenario: Press 5 capability executes
    Given the calculator eApp is open
    When capability EALC1006 (Press 5) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
