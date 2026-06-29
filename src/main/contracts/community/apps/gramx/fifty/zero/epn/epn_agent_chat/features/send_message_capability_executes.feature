# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Send Message to work so I can use Evo.

  @EALC6002 @EAIV6014 @EAIV6019 @EAIV6005 @EAIV6002 @EAIV6029 @EAIV6005 @EAIV6027 @EAIV6016
  Scenario: Send Message capability executes
    Given EAIV6014 (Active Persona Id) is set to "epn.concierge.v1"
    And EAIV6019 (Active Conversation ID) is set to "test-value"
    And EAIV6005 (Composer Text) is set to "hello from scenario test"
    When capability EALC6002 (Send Message) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6029 (Pending Turn) has at least 1 item
    Then EAIV6005 (Composer Text) is not empty
    Then EAIV6027 (Mesh Response Message) is not empty
    Then EAIV6016 (Latest Run) is not empty
