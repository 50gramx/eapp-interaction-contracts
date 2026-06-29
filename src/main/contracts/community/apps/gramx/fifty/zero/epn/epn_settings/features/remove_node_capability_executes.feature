# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Settings
  # As a user, I want Remove Node to work so I can use Settings.

  @EALC12020 @EAIV12021 @EAIV12019
  Scenario: Remove Node capability executes
    Given the Settings eApp is open
    When capability EALC12020 (Remove Node) is invoked
    Then EAIV12021 (Node Mgmt Result) is not empty
    Then EAIV12019 (Nodes List) is not empty
