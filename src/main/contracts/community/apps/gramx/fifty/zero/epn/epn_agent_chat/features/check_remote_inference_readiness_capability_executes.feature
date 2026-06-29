# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Evo
  # As a user, I want Check Remote Inference Readiness to work so I can use Evo.

  @EALC6020 @EAIV6002 @EAIV6016
  Scenario: Check Remote Inference Readiness capability executes
    Given the Evo eApp is open
    When capability EALC6020 (Check Remote Inference Readiness) is invoked
    Then EAIV6002 (Messages) has at least 1 item
    Then EAIV6016 (Latest Run) is not empty
