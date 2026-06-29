# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Resource Market
  # As a user, I want Init Page to work so I can use Resource Market.

  @EALC13001 @EAIV13001 @EAIV13003
  Scenario: Init Page capability executes
    Given the Resource Market eApp is open
    When capability EALC13001 (Init Page) is invoked
    Then EAIV13001 (Offers) is not empty
    Then EAIV13003 (Price Summary) is not empty
