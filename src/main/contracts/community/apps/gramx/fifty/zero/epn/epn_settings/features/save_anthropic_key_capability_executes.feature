# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Save Anthropic Key to work so I can use Settings.

  @EALC12012 @EAIV12014 @EAIV12013
  Scenario: Save Anthropic Key capability executes
    Given the Settings eApp is open
    When capability EALC12012 (Save Anthropic Key) is invoked
    Then EAIV12014 (Key Save Result) is not empty
    Then EAIV12013 (Keys Status) is not empty
