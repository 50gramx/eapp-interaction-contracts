# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Toggle Start Gram With App to work so I can use Settings.

  @EALC12033 @EAIV12036
  Scenario: Toggle Start Gram With App capability executes
    Given the Settings eApp is open
    When capability EALC12033 (Toggle Start Gram With App) is invoked
    Then EAIV12036 (Start Gram With App) is not empty
