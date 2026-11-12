# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Pick Token to work so I can use Operators.

  @EALC9027 @EAIV9025
  Scenario: Pick Token capability executes
    Given the Operators eApp is open
    When capability EALC9027 (Pick Token) is invoked
    Then EAIV9025 (Picked Token) is not empty
