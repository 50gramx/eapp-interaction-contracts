# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Network
  # As a user, I want Connect Peer to work so I can use Network.

  @EALC7004 @EAIV7004 @EAIV7002
  Scenario: Connect Peer capability executes
    Given the Network eApp is open
    When capability EALC7004 (Connect Peer) is invoked
    Then EAIV7004 (Connect Result) is not empty
    Then EAIV7002 (Peer List) is not empty
