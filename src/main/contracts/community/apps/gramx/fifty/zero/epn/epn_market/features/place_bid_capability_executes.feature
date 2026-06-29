# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Resource Market
  # As a user, I want Place Bid to work so I can use Resource Market.

  @EALC13012 @EAIV13012
  Scenario: Place Bid capability executes
    Given the Resource Market eApp is open
    When capability EALC13012 (Place Bid) is invoked
    Then EAIV13012 (Bid Result) is not empty
