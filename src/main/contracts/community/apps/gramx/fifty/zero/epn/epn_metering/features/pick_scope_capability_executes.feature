# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Pick Scope to work so I can use Metering.

  @EALC11005 @EAIV11027
  Scenario: Pick Scope capability executes
    Given the Metering eApp is open
    When capability EALC11005 (Pick Scope) is invoked
    Then EAIV11027 (Usage) is not empty
