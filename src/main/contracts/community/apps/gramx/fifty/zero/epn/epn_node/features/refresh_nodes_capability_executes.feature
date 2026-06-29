# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Refresh Nodes to work so I can use Node.

  @EALC14021 @EAIV14020
  Scenario: Refresh Nodes capability executes
    Given the Node eApp is open
    When capability EALC14021 (Refresh Nodes) is invoked
    Then EAIV14020 (Nodes) is not empty
