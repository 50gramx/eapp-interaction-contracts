# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Load Nodes to work so I can use Settings.

  @EALC12018 @EAIV12019
  Scenario: Load Nodes capability executes
    Given the Settings eApp is open
    When capability EALC12018 (Load Nodes) is invoked
    Then EAIV12019 (Nodes List) is not empty
