# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Look At Gram to work so I can use Operators.

  @EALC9037 @EAIV9027 @EAIV9009
  Scenario: Look At Gram capability executes
    Given the Operators eApp is open
    When capability EALC9037 (Look At Gram) is invoked
    Then EAIV9027 (Your Grams) is not empty
    Then EAIV9009 (Fleet Operators) is not empty
