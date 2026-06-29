# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Node
  # As a user, I want Connect Endpoint to work so I can use Node.

  @EALC14015 @EAIV14015
  Scenario: Connect Endpoint capability executes
    Given the Node eApp is open
    When capability EALC14015 (Connect Endpoint) is invoked
    Then EAIV14015 (Connect Result) is not empty
