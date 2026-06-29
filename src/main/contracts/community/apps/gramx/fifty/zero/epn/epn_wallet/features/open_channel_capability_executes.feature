# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Wallet
  # As a user, I want Open Channel to work so I can use Wallet.

  @EALC8005 @EAIV8003 @EAIV8002 @EAIV8001
  Scenario: Open Channel capability executes
    Given the Wallet eApp is open
    When capability EALC8005 (Open Channel) is invoked
    Then EAIV8003 (Action Result) is not empty
    Then EAIV8002 (Channel List) is not empty
    Then EAIV8001 (Wallet Info) is not empty
