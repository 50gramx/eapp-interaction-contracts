# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: calculator
  # As a user, I want Clear to work so I can use calculator.

  @EALC1011 @EAIV1002 @EAIV1003
  Scenario: Clear capability executes
    Given the calculator eApp is open
    When capability EALC1011 (Clear) is invoked
    Then EAIV1002 (Display Text) is not empty
    Then EAIV1003 (Clear Button Label) is not empty
