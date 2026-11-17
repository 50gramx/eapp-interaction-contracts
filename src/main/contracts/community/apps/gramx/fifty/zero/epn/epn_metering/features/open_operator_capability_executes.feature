# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Open Operator to work so I can use Metering.

  @EALC11006 @EAIV11027
  Scenario: Open Operator capability executes
    Given the Metering eApp is open
    When capability EALC11006 (Open Operator) is invoked
    Then EAIV11027 (Usage) is not empty
