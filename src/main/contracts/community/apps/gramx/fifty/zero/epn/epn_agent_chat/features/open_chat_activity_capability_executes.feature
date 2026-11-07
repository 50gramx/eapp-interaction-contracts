# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open Chat Activity to work so I can use Evo.

  @EALC6033 @EAIV6019 @EAIV6057 @EAIV6046
  Scenario: Open Chat Activity capability executes
    Given EAIV6019 (Active Conversation ID) is set to "test-value"
    When capability EALC6033 (Open Chat Activity) is invoked
    Then EAIV6057 (Activity) is not empty
    Then EAIV6046 (View Mode) is not empty
