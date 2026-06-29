# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Init Page to work so I can use Metering.

  @EALC11001 @EAIV11001 @EAIV11002 @EAIV11004 @EAIV11005
  Scenario: Init Page capability executes
    Given the Metering eApp is open
    When capability EALC11001 (Init Page) is invoked
    Then EAIV11001 (Wallet Info) is not empty
    Then EAIV11002 (Channels) is not empty
    Then EAIV11004 (Resources) is not empty
    Then EAIV11005 (Metering Summary) is not empty
