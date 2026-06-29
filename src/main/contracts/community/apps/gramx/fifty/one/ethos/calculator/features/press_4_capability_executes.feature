# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 4 to work so I can use calculator.

  @EALC1005 @EAIV1003
  Scenario: Press 4 capability executes
    Given the calculator eApp is open
    When capability EALC1005 (Press 4) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
