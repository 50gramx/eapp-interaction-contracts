# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Load Growth Board to work so I can use Operators.

  @EALC9011 @EAIV9011
  Scenario: Load Growth Board capability executes
    Given the Operators eApp is open
    When capability EALC9011 (Load Growth Board) is invoked
    Then EAIV9011 (Growth) is not empty
