# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Submit KYC Email to work so I can use Settings.

  @EALC12024 @EAIV12028
  Scenario: Submit KYC Email capability executes
    Given the Settings eApp is open
    When capability EALC12024 (Submit KYC Email) is invoked
    Then EAIV12028 (KYC Initiate Result) is not empty
