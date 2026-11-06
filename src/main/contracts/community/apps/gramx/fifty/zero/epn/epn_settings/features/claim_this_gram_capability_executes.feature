# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Claim This Gram to work so I can use Settings.

  @EALC12032 @EAIV12033 @EAIV12031 @EAIV12035
  Scenario: Claim This Gram capability executes
    Given the Settings eApp is open
    When capability EALC12032 (Claim This Gram) is invoked
    Then EAIV12033 (Claim Message) is not empty
    Then EAIV12031 (Claim Result) is not empty
    Then EAIV12035 (Claim State Result) is not empty
