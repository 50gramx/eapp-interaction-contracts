# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Use Discovered Persona to work so I can use Evo.

  @EALC6016 @EAIV6014
  Scenario: Use Discovered Persona capability executes
    Given the Evo eApp is open
    When capability EALC6016 (Use Discovered Persona) is invoked
    Then EAIV6014 (Active Persona Id) is not empty
