# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Network
  # As a user, I want Find Peer by DID to work so I can use Network.

  @EALC7006 @EAIV7006
  Scenario: Find Peer by DID capability executes
    Given the Network eApp is open
    When capability EALC7006 (Find Peer by DID) is invoked
    Then EAIV7006 (Find Result) is not empty
