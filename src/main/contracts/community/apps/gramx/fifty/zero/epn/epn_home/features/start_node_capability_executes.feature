# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: EP&N Node
  # As a user, I want Start Node to work so I can use EP&N Node.

  @EALC5014 @EAIV5006 @EAIV5004
  Scenario: Start Node capability executes
    Given the EP&N Node eApp is open
    When capability EALC5014 (Start Node) is invoked
    Then EAIV5006 (Node Action Result) is not empty
    Then EAIV5004 (Node Identity) is not empty
