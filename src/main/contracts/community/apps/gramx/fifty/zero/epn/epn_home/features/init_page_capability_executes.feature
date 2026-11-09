# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Home
  # As a user, I want Init Page to work so I can use Home.

  @EALC5005 @EAIV5008 @EAIV5004
  Scenario: Init Page capability executes
    Given the Home eApp is open
    When capability EALC5005 (Init Page) is invoked
    Then EAIV5008 (Capacity Plan) is not empty
    Then EAIV5004 (Node Identity) is not empty
