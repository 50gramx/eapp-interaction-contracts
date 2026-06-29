# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Clean Device to work so I can use Node.

  @EALC14028 @EAIV14028 @EAIV14026 @EAIV14020
  Scenario: Clean Device capability executes
    Given the Node eApp is open
    When capability EALC14028 (Clean Device) is invoked
    Then EAIV14028 (Clean Result) is not empty
    Then EAIV14026 (Selection Flag) is not empty
    Then EAIV14020 (Nodes) is not empty
