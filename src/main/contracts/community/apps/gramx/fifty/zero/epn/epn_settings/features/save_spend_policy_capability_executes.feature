# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Save Spend Policy to work so I can use Settings.

  @EALC12005 @EAIV12001
  Scenario: Save Spend Policy capability executes
    Given the Settings eApp is open
    When capability EALC12005 (Save Spend Policy) is invoked
    Then EAIV12001 (Spend Policy) is not empty
