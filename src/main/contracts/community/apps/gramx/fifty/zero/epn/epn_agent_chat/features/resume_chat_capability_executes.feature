# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Resume Chat to work so I can use Evo.

  @EALC6032 @EAIV6019 @EAIV6055 @EAIV6057 @EAIV6046
  Scenario: Resume Chat capability executes
    Given EAIV6019 (Active Conversation ID) is set to "test-value"
    When capability EALC6032 (Resume Chat) is invoked
    Then EAIV6055 (Opened Chat) is not empty
    Then EAIV6057 (Activity) is not empty
    Then EAIV6046 (View Mode) is not empty
