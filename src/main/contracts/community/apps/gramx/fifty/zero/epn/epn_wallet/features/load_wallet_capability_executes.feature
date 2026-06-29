# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Wallet
  # As a user, I want Load Wallet to work so I can use Wallet.

  @EALC8001 @EAIV8001
  Scenario: Load Wallet capability executes
    Given the Wallet eApp is open
    When capability EALC8001 (Load Wallet) is invoked
    Then EAIV8001 (Wallet Info) is not empty
