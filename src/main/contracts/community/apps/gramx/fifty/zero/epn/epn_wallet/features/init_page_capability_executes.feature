# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Wallet
  # As a user, I want Init Page to work so I can use Wallet.

  @EALC8007 @EAIV8001 @EAIV8002
  Scenario: Init Page capability executes
    Given the Wallet eApp is open
    When capability EALC8007 (Init Page) is invoked
    Then EAIV8001 (Wallet Info) is not empty
    Then EAIV8002 (Channel List) is not empty
