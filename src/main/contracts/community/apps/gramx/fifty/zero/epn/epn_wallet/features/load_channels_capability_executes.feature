# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Wallet
  # As a user, I want Load Channels to work so I can use Wallet.

  @EALC8002 @EAIV8002
  Scenario: Load Channels capability executes
    Given the Wallet eApp is open
    When capability EALC8002 (Load Channels) is invoked
    Then EAIV8002 (Channel List) is not empty
