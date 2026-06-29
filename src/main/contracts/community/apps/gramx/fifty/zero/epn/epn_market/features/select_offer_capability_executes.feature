# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Resource Market
  # As a user, I want Select Offer to work so I can use Resource Market.

  @EALC13008 @EAIV13008
  Scenario: Select Offer capability executes
    Given the Resource Market eApp is open
    When capability EALC13008 (Select Offer) is invoked
    Then EAIV13008 (Selected Offer) is not empty
