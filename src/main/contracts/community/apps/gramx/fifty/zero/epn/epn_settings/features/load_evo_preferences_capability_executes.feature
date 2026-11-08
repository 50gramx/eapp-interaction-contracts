# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Load Evo Preferences to work so I can use Settings.

  @EALC12034 @EAIV12037
  Scenario: Load Evo Preferences capability executes
    Given the Settings eApp is open
    When capability EALC12034 (Load Evo Preferences) is invoked
    Then EAIV12037 (Evo Preferences) is not empty
