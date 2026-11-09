# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Send Message (watch the turn) to work so I can use Evo.

  @EALC6037 @EAIV6019 @EAIV6002 @EAIV6016 @EAIV6017 @EAIV6057
  Scenario: Send Message (watch the turn) capability executes
    Given EAIV6019 (Active Conversation ID) is set to "test-value"
    When capability EALC6037 (Send Message (watch the turn)) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6016 (Latest Run) is not empty
    Then EAIV6017 (Latest Approval) is not empty
    Then EAIV6057 (Activity) is not empty
