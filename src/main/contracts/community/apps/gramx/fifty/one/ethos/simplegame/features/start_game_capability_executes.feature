# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: simplegame
  # As a user, I want Start Game to work so I can use simplegame.

  @EALC1004 @EAIV1003
  Scenario: Start Game capability executes
    Given the simplegame eApp is open
    When capability EALC1004 (Start Game) is invoked
    Then EAIV1003 (Player Name) is not empty
