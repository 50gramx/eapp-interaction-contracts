# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Add Lite Node to work so I can use Node.

  @EALC14023 @EAIV14022 @EAIV14020
  Scenario: Add Lite Node capability executes
    Given the Node eApp is open
    When capability EALC14023 (Add Lite Node) is invoked
    Then EAIV14022 (Create Result) is not empty
    Then EAIV14020 (Nodes) is not empty
