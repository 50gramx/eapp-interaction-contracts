# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Clean Device to work so I can use Settings.

  @EALC12021 @EAIV12021 @EAIV12019
  Scenario: Clean Device capability executes
    Given the Settings eApp is open
    When capability EALC12021 (Clean Device) is invoked
    Then EAIV12021 (Node Mgmt Result) is not empty
    Then EAIV12019 (Nodes List) is not empty
