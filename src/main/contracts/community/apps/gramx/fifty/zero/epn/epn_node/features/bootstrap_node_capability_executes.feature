# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Gram
  # As a user, I want Bootstrap Node to work so I can use Gram.

  @EALC14003 @EAIV14002
  Scenario: Bootstrap Node capability executes
    Given the Gram eApp is open
    When capability EALC14003 (Bootstrap Node) is invoked
    Then EAIV14002 (Start Result) is not empty
