# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Load Sites to work so I can use Operators.

  @EALC9012 @EAIV9013 @EAIV9015
  Scenario: Load Sites capability executes
    Given the Operators eApp is open
    When capability EALC9012 (Load Sites) is invoked
    Then EAIV9013 (Sites) is not empty
    Then EAIV9015 (Site) is not empty
