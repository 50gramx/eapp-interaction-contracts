# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Toggle Logged Providers to work so I can use Settings.

  @EALC12036 @EAIV12037
  Scenario: Toggle Logged Providers capability executes
    Given the Settings eApp is open
    When capability EALC12036 (Toggle Logged Providers) is invoked
    Then EAIV12037 (Evo Preferences) is not empty
