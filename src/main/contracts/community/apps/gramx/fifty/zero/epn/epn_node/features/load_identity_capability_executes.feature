# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Load Identity to work so I can use Gram.

  @EALC14012 @EAIV14012
  Scenario: Load Identity capability executes
    Given the Gram eApp is open
    When capability EALC14012 (Load Identity) is invoked
    Then EAIV14012 (My Identity) is not empty
