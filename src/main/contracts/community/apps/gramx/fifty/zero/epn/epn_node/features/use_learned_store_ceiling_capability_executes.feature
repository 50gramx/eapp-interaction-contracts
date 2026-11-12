# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Use Learned Store Ceiling to work so I can use Gram.

  @EALC14034 @EAIV14054
  Scenario: Use Learned Store Ceiling capability executes
    Given the Gram eApp is open
    When capability EALC14034 (Use Learned Store Ceiling) is invoked
    Then EAIV14054 (Network) is not empty
