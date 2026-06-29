# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Init Personas to work so I can use Evo.

  @EALC6015 @EAIV6015 @EAIV6016 @EAIV6017
  Scenario: Init Personas capability executes
    Given the Evo eApp is open
    When capability EALC6015 (Init Personas) is invoked
    Then EAIV6015 (Personas) has at least 1 item
    Then EAIV6016 (Latest Run) is not empty
    Then EAIV6017 (Latest Approval) is not empty
