# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Close Workflows to work so I can use Evo.

  @EALC6025 @EAIV6046
  Scenario: Close Workflows capability executes
    Given the Evo eApp is open
    When capability EALC6025 (Close Workflows) is invoked
    Then EAIV6046 (View Mode) is not empty
