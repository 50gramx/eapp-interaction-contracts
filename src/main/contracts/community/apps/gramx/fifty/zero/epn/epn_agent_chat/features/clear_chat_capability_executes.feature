# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Clear Chat to work so I can use Evo.

  @EALC6003 @EAIV6002
  Scenario: Clear Chat capability executes
    Given the Evo eApp is open
    When capability EALC6003 (Clear Chat) is invoked
    Then EAIV6002 (Messages) has at least 1 item
