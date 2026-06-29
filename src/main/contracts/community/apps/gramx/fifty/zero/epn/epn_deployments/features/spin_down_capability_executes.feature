# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Spin Down to work so I can use Operators.

  @EALC9006 @EAIV9005
  Scenario: Spin Down capability executes
    Given the Operators eApp is open
    When capability EALC9006 (Spin Down) is invoked
    Then EAIV9005 (Action Result) is not empty
