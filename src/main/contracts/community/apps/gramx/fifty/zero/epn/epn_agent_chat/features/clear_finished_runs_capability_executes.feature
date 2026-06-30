# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Clear Finished Runs to work so I can use Evo.

  @EALC6022 @EAIV6031
  Scenario: Clear Finished Runs capability executes
    Given the Evo eApp is open
    When capability EALC6022 (Clear Finished Runs) is invoked
    Then EAIV6031 (Workflows) has at least 1 item
