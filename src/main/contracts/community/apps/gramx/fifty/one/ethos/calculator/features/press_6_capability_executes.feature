# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press 6 to work so I can use calculator.

  @EALC1007 @EAIV1003
  Scenario: Press 6 capability executes
    Given the calculator eApp is open
    When capability EALC1007 (Press 6) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
