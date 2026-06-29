# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 3 to work so I can use calculator.

  @EALC1004 @EAIV1003
  Scenario: Press 3 capability executes
    Given the calculator eApp is open
    When capability EALC1004 (Press 3) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
