# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Run Ready Checks to work so I can use Evo.

  @EALC6021 @EAIV6016
  Scenario: Run Ready Checks capability executes
    Given the Evo eApp is open
    When capability EALC6021 (Run Ready Checks) is invoked
    Then EAIV6016 (Latest Run) is not empty
