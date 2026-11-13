# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: My grams
  # As a user, I want Load My Grams to work so I can use My grams.

  @EALC17001 @EAIV17002
  Scenario: Load My Grams capability executes
    Given the My grams eApp is open
    When capability EALC17001 (Load My Grams) is invoked
    Then EAIV17002 (My Grams) is not empty
