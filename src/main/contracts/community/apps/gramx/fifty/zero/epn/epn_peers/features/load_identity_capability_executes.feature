# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Network
  # As a user, I want Load Identity to work so I can use Network.

  @EALC7001 @EAIV7001
  Scenario: Load Identity capability executes
    Given the Network eApp is open
    When capability EALC7001 (Load Identity) is invoked
    Then EAIV7001 (Node Identity) is not empty
