# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open All Activity to work so I can use Evo.

  @EALC6034 @EAIV6057 @EAIV6046
  Scenario: Open All Activity capability executes
    Given the Evo eApp is open
    When capability EALC6034 (Open All Activity) is invoked
    Then EAIV6057 (Activity) is not empty
    Then EAIV6046 (View Mode) is not empty
