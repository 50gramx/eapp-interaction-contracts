# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Choose Route to work so I can use Settings.

  @EALC12035 @EAIV12037
  Scenario: Choose Route capability executes
    Given the Settings eApp is open
    When capability EALC12035 (Choose Route) is invoked
    Then EAIV12037 (Evo Preferences) is not empty
