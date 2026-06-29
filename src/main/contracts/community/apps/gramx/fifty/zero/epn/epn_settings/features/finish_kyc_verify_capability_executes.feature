# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Finish KYC Verify to work so I can use Settings.

  @EALC12029 @EAIV12022
  Scenario: Finish KYC Verify capability executes
    Given the Settings eApp is open
    When capability EALC12029 (Finish KYC Verify) is invoked
    Then EAIV12022 (KYC Verify Flow Screen) is not empty
