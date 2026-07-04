# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open Workflows to work so I can use Evo.

  @EALC6024 @EAIV6031 @EAIV6046
  Scenario: Open Workflows capability executes
    Given the Evo eApp is open
    When capability EALC6024 (Open Workflows) is invoked
    Then EAIV6031 (Workflows) has at least 1 item
    Then EAIV6046 (View Mode) is not empty
