# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Spin Up to work so I can use Operators.

  @EALC9005 @EAIV9005
  Scenario: Spin Up capability executes
    Given the Operators eApp is open
    When capability EALC9005 (Spin Up) is invoked
    Then EAIV9005 (Action Result) is not empty
