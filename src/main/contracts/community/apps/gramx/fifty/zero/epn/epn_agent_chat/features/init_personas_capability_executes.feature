# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Init Personas to work so I can use Evo.

  @EALC6015 @EAIV6019 @EAIV6031 @EAIV6055 @EAIV6057 @EAIV6016 @EAIV6017
  Scenario: Init Personas capability executes
    Given EAIV6019 (Active Conversation ID) is set to "test-value"
    When capability EALC6015 (Init Personas) is invoked
    Then EAIV6031 (Workflows) has at least 1 item
    Then EAIV6055 (Opened Chat) is not empty
    Then EAIV6057 (Activity) is not empty
    Then EAIV6016 (Latest Run) is not empty
    Then EAIV6017 (Latest Approval) is not empty
