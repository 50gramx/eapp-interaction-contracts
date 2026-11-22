# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Save Spoken Language to work so I can use Settings.

  @EALC12038 @EAIV12042
  Scenario: Save Spoken Language capability executes
    Given the Settings eApp is open
    When capability EALC12038 (Save Spoken Language) is invoked
    Then EAIV12042 (Spoken Language) is not empty
