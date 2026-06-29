# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Save Node Resources to work so I can use Settings.

  @EALC12017 @EAIV12018
  Scenario: Save Node Resources capability executes
    Given the Settings eApp is open
    When capability EALC12017 (Save Node Resources) is invoked
    Then EAIV12018 (Resources Save Result) is not empty
