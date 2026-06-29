# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Network
  # As a user, I want Load Peers to work so I can use Network.

  @EALC7002 @EAIV7002 @EAIV7007
  Scenario: Load Peers capability executes
    Given the Network eApp is open
    When capability EALC7002 (Load Peers) is invoked
    Then EAIV7002 (Peer List) is not empty
    Then EAIV7007 (Family Status) is not empty
