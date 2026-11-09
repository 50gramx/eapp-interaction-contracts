# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Home
  # As a user, I want Set Up Node to work so I can use Home.

  @EALC5016 @EAIV5006 @EAIV5004
  Scenario: Set Up Node capability executes
    Given the Home eApp is open
    When capability EALC5016 (Set Up Node) is invoked
    Then EAIV5006 (Node Action Result) is not empty
    Then EAIV5004 (Node Identity) is not empty
