# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Dismiss Run to work so I can use Evo.

  @EALC6023 @EAIV6031
  Scenario: Dismiss Run capability executes
    Given the Evo eApp is open
    When capability EALC6023 (Dismiss Run) is invoked
    Then EAIV6031 (Workflows) has at least 1 item
