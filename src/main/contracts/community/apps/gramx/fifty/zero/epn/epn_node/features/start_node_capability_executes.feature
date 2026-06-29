# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Start Node to work so I can use Node.

  @EALC14001 @EAIV14002
  Scenario: Start Node capability executes
    Given the Node eApp is open
    When capability EALC14001 (Start Node) is invoked
    Then EAIV14002 (Start Result) is not empty
