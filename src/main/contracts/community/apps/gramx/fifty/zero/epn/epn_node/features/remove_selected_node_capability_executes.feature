# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Remove Selected Node to work so I can use Node.

  @EALC14027 @EAIV14027 @EAIV14026 @EAIV14020
  Scenario: Remove Selected Node capability executes
    Given the Node eApp is open
    When capability EALC14027 (Remove Selected Node) is invoked
    Then EAIV14027 (Action Result) is not empty
    Then EAIV14026 (Selection Flag) is not empty
    Then EAIV14020 (Nodes) is not empty
