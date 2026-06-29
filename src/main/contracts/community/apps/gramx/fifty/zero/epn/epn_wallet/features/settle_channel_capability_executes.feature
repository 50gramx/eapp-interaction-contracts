# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Wallet
  # As a user, I want Settle Channel to work so I can use Wallet.

  @EALC8006 @EAIV8003 @EAIV8002 @EAIV8001
  Scenario: Settle Channel capability executes
    Given the Wallet eApp is open
    When capability EALC8006 (Settle Channel) is invoked
    Then EAIV8003 (Action Result) is not empty
    Then EAIV8002 (Channel List) is not empty
    Then EAIV8001 (Wallet Info) is not empty
