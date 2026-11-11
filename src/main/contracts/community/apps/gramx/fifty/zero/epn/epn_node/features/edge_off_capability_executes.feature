# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Edge Off to work so I can use Gram.

  @EALC14031 @EAIV14054
  Scenario: Edge Off capability executes
    Given the Gram eApp is open
    When capability EALC14031 (Edge Off) is invoked
    Then EAIV14054 (Network) is not empty
