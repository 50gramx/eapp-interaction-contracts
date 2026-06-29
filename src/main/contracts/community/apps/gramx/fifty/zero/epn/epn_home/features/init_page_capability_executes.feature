# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: EP&N Node
  # As a user, I want Init Page to work so I can use EP&N Node.

  @EALC5005 @EAIV5008 @EAIV5004
  Scenario: Init Page capability executes
    Given the EP&N Node eApp is open
    When capability EALC5005 (Init Page) is invoked
    Then EAIV5008 (Capacity Plan) is not empty
    Then EAIV5004 (Node Identity) is not empty
