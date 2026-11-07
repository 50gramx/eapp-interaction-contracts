# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open Activity Chat to work so I can use Evo.

  @EALC6035 @EAIV6019 @EAIV6055 @EAIV6057 @EAIV6046
  Scenario: Open Activity Chat capability executes
    Given EAIV6019 (Active Conversation ID) is set to "test-value"
    When capability EALC6035 (Open Activity Chat) is invoked
    Then EAIV6055 (Opened Chat) is not empty
    Then EAIV6057 (Activity) is not empty
    Then EAIV6046 (View Mode) is not empty
