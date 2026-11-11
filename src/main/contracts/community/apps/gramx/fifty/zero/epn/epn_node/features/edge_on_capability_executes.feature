# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Edge On to work so I can use Gram.

  @EALC14030 @EAIV14054
  Scenario: Edge On capability executes
    Given the Gram eApp is open
    When capability EALC14030 (Edge On) is invoked
    Then EAIV14054 (Network) is not empty
