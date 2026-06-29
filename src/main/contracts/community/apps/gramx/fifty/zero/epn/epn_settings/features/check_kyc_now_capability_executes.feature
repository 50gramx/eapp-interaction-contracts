# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Check KYC Now to work so I can use Settings.

  @EALC12026 @EAIV12025
  Scenario: Check KYC Now capability executes
    Given the Settings eApp is open
    When capability EALC12026 (Check KYC Now) is invoked
    Then EAIV12025 (KYC Poll Result) is not empty
