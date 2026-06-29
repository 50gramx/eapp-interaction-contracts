# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Evaluate Expression to work so I can use calculator.

  @EALC1017 @EAIV1003
  Scenario: Evaluate Expression capability executes
    Given the calculator eApp is open
    When capability EALC1017 (Evaluate Expression) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
