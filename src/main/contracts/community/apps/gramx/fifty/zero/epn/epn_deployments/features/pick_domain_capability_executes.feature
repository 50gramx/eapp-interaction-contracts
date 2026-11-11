# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Pick Domain to work so I can use Operators.

  @EALC9015 @EAIV9018
  Scenario: Pick Domain capability executes
    Given the Operators eApp is open
    When capability EALC9015 (Pick Domain) is invoked
    Then EAIV9018 (Picked Domain) is not empty
