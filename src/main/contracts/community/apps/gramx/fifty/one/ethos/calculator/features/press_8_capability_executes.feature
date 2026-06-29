# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 8 to work so I can use calculator.

  @EALC1009 @EAIV1003
  Scenario: Press 8 capability executes
    Given the calculator eApp is open
    When capability EALC1009 (Press 8) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
