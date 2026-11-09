# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Stop Node to work so I can use Gram.

  @EALC14002 @EAIV14003
  Scenario: Stop Node capability executes
    Given the Gram eApp is open
    When capability EALC14002 (Stop Node) is invoked
    Then EAIV14003 (Stop Result) is not empty
