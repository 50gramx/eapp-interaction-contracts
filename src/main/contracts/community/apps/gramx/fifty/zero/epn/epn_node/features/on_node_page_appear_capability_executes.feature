# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want On Node Page Appear to work so I can use Node.

  @EALC14020 @EAIV14012 @EAIV14020 @EAIV14049
  Scenario: On Node Page Appear capability executes
    Given the Node eApp is open
    When capability EALC14020 (On Node Page Appear) is invoked
    Then EAIV14012 (My Identity) is not empty
    Then EAIV14020 (Nodes) is not empty
    Then EAIV14049 (Node Capabilities) is not empty
