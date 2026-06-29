# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: simplegame
  # As a user, I want Submit Guess to work so I can use simplegame.

  @EALC1006 @EAIV1001
  Scenario: Submit Guess capability executes
    Given the simplegame eApp is open
    When capability EALC1006 (Submit Guess) is invoked
    Then EAIV1001 (Player Score) is not empty
