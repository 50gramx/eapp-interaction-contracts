# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Network
  # As a user, I want Init Page to work so I can use Network.

  @EALC7007 @EAIV7001 @EAIV7002 @EAIV7007
  Scenario: Init Page capability executes
    Given the Network eApp is open
    When capability EALC7007 (Init Page) is invoked
    Then EAIV7001 (Node Identity) is not empty
    Then EAIV7002 (Peer List) is not empty
    Then EAIV7007 (Family Status) is not empty
