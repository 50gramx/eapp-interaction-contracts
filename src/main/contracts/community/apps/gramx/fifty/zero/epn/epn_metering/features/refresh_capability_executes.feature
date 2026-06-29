# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Refresh to work so I can use Metering.

  @EALC11002 @EAIV11001 @EAIV11002 @EAIV11005
  Scenario: Refresh capability executes
    Given the Metering eApp is open
    When capability EALC11002 (Refresh) is invoked
    Then EAIV11001 (Wallet Info) is not empty
    Then EAIV11002 (Channels) is not empty
    Then EAIV11005 (Metering Summary) is not empty
