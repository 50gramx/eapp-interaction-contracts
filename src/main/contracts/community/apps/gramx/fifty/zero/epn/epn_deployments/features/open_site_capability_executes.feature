# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Operators
  # As a user, I want Open Site to work so I can use Operators.

  @EALC9013 @EAIV9015
  Scenario: Open Site capability executes
    Given the Operators eApp is open
    When capability EALC9013 (Open Site) is invoked
    Then EAIV9015 (Site) is not empty
