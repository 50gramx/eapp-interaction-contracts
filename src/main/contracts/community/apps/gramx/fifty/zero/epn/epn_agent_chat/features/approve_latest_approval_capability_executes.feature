# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Approve Latest Approval to work so I can use Evo.

  @EALC6018 @EAIV6002 @EAIV6031 @EAIV6017 @EAIV6016
  Scenario: Approve Latest Approval capability executes
    Given the Evo eApp is open
    When capability EALC6018 (Approve Latest Approval) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6031 (Workflows) has at least 1 item
    Then EAIV6017 (Latest Approval) is not empty
    Then EAIV6016 (Latest Run) is not empty
