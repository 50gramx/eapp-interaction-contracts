# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Start Email Verify to work so I can use Settings.

  @EALC12023 @EAIV12022 @EAIV12024
  Scenario: Start Email Verify capability executes
    Given the Settings eApp is open
    When capability EALC12023 (Start Email Verify) is invoked
    Then EAIV12022 (KYC Verify Flow Screen) is not empty
    Then EAIV12024 (KYC Flow Error) is not empty
