# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Load Fleet Board to work so I can use Operators.

  @EALC9010 @EAIV9009
  Scenario: Load Fleet Board capability executes
    Given the Operators eApp is open
    When capability EALC9010 (Load Fleet Board) is invoked
    Then EAIV9009 (Fleet Operators) is not empty
