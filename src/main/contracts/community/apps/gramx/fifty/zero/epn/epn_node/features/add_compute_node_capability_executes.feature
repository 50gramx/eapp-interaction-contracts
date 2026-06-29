# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Add Compute Node to work so I can use Node.

  @EALC14024 @EAIV14022 @EAIV14020
  Scenario: Add Compute Node capability executes
    Given the Node eApp is open
    When capability EALC14024 (Add Compute Node) is invoked
    Then EAIV14022 (Create Result) is not empty
    Then EAIV14020 (Nodes) is not empty
