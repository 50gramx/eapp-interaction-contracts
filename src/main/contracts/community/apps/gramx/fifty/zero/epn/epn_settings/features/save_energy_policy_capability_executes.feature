# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Save Energy Policy to work so I can use Settings.

  @EALC12009 @EAIV12007
  Scenario: Save Energy Policy capability executes
    Given the Settings eApp is open
    When capability EALC12009 (Save Energy Policy) is invoked
    Then EAIV12007 (Energy Policy) is not empty
