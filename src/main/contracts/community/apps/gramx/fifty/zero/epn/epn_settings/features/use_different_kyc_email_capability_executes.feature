# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Use Different KYC Email to work so I can use Settings.

  @EALC12028 @EAIV12022 @EAIV12024
  Scenario: Use Different KYC Email capability executes
    Given the Settings eApp is open
    When capability EALC12028 (Use Different KYC Email) is invoked
    Then EAIV12022 (KYC Verify Flow Screen) is not empty
    Then EAIV12024 (KYC Flow Error) is not empty
