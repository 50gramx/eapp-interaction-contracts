# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Deny Latest Approval to work so I can use Evo.

  @EALC6019 @EAIV6002 @EAIV6017
  Scenario: Deny Latest Approval capability executes
    Given the Evo eApp is open
    When capability EALC6019 (Deny Latest Approval) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6017 (Latest Approval) is not empty
