# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Resource Market
  # As a user, I want Apply Filter to work so I can use Resource Market.

  @EALC13003 @EAIV13001 @EAIV13003
  Scenario: Apply Filter capability executes
    Given the Resource Market eApp is open
    When capability EALC13003 (Apply Filter) is invoked
    Then EAIV13001 (Offers) is not empty
    Then EAIV13003 (Price Summary) is not empty
