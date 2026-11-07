# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Open Chats to work so I can use Evo.

  @EALC6031 @EAIV6053 @EAIV6046
  Scenario: Open Chats capability executes
    Given the Evo eApp is open
    When capability EALC6031 (Open Chats) is invoked
    Then EAIV6053 (Chats) is not empty
    Then EAIV6046 (View Mode) is not empty
