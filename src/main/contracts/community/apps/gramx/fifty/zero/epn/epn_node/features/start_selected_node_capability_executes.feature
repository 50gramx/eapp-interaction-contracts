# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Start Selected Node to work so I can use Node.

  @EALC14029 @EAIV14026 @EAIV14020
  Scenario: Start Selected Node capability executes
    Given the Node eApp is open
    When capability EALC14029 (Start Selected Node) is invoked
    Then EAIV14026 (Selection Flag) is not empty
    Then EAIV14020 (Nodes) is not empty
