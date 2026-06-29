# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Install Operator to work so I can use Operators.

  @EALC9004 @EAIV9005
  Scenario: Install Operator capability executes
    Given the Operators eApp is open
    When capability EALC9004 (Install Operator) is invoked
    Then EAIV9005 (Action Result) is not empty
