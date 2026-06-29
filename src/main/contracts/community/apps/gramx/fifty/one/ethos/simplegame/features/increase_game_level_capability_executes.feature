# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: simplegame
  # As a user, I want Increase Game Level to work so I can use simplegame.

  @EALC1002 @EAIV1002
  Scenario: Increase Game Level capability executes
    Given the simplegame eApp is open
    When capability EALC1002 (Increase Game Level) is invoked
    Then EAIV1002 (Game Level) is not empty
