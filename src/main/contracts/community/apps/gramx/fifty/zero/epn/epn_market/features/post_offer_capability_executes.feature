# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Resource Market
  # As a user, I want Post Offer to work so I can use Resource Market.

  @EALC13007 @EAIV13007 @EAIV13001 @EAIV13003
  Scenario: Post Offer capability executes
    Given the Resource Market eApp is open
    When capability EALC13007 (Post Offer) is invoked
    Then EAIV13007 (Post Result) is not empty
    Then EAIV13001 (Offers) is not empty
    Then EAIV13003 (Price Summary) is not empty
