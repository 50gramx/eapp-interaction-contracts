# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Pick Preview to work so I can use Operators.

  @EALC9022 @EAIV9024
  Scenario: Pick Preview capability executes
    Given the Operators eApp is open
    When capability EALC9022 (Pick Preview) is invoked
    Then EAIV9024 (Picked Preview) is not empty
