# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Init Page to work so I can use Operators.

  @EALC9001 @EAIV9002
  Scenario: Init Page capability executes
    Given the Operators eApp is open
    When capability EALC9001 (Init Page) is invoked
    Then EAIV9002 (Personas) is not empty
