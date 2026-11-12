# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Set Store Ceiling to work so I can use Gram.

  @EALC14033 @EAIV14057.text @EAIV14054
  Scenario: Set Store Ceiling capability executes
    Given EAIV14057.text (EAIV14057.text) is set to "test-value"
    When capability EALC14033 (Set Store Ceiling) is invoked
    Then EAIV14054 (Network) is not empty
