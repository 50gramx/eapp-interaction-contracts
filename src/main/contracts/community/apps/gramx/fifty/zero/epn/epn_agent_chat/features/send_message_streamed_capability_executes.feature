# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Send Message (streamed) to work so I can use Evo.

  @EALC6036 @EAIV6014 @EAIV6019 @EAIV6005 @EAIV6002 @EAIV6029 @EAIV6005 @EAIV6060
  Scenario: Send Message (streamed) capability executes
    Given EAIV6014 (Active Persona Id) is set to "epn.concierge.v1"
    And EAIV6019 (Active Conversation ID) is set to "test-value"
    And EAIV6005 (Composer Text) is set to "hello from scenario test"
    When capability EALC6036 (Send Message (streamed)) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6029 (Pending Turn) has at least 1 item
    Then EAIV6005 (Composer Text) is not empty
    Then EAIV6060 (Watched Send Result) is not empty
