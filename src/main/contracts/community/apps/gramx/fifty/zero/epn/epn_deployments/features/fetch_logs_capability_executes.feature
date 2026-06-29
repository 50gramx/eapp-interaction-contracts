# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Fetch Logs to work so I can use Operators.

  @EALC9007 @EAIV9006
  Scenario: Fetch Logs capability executes
    Given the Operators eApp is open
    When capability EALC9007 (Fetch Logs) is invoked
    Then EAIV9006 (Deployment Logs) is not empty
