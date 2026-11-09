# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Home
  # As a user, I want Stop Node to work so I can use Home.

  @EALC5015 @EAIV5006 @EAIV5004
  Scenario: Stop Node capability executes
    Given the Home eApp is open
    When capability EALC5015 (Stop Node) is invoked
    Then EAIV5006 (Node Action Result) is not empty
    Then EAIV5004 (Node Identity) is not empty
