# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Resend KYC Email to work so I can use Settings.

  @EALC12027 @EAIV12028
  Scenario: Resend KYC Email capability executes
    Given the Settings eApp is open
    When capability EALC12027 (Resend KYC Email) is invoked
    Then EAIV12028 (KYC Initiate Result) is not empty
