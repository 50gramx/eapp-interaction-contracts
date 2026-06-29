# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: simplegame
  # As a user, I want Update Player Score to work so I can use simplegame.

  @EALC1001 @EAIV1001
  Scenario: Update Player Score capability executes
    Given the simplegame eApp is open
    When capability EALC1001 (Update Player Score) is invoked
    Then EAIV1001 (Player Score) is not empty
