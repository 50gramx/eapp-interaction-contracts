# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Press Decimal to work so I can use calculator.

  @EALC1018 @EAIV1003
  Scenario: Press Decimal capability executes
    Given the calculator eApp is open
    When capability EALC1018 (Press Decimal) is invoked
    Then EAIV1003 (Clear Button Label) is not empty
