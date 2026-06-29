# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: test
  # As a user, I want Open Help Request Form to work so I can use test.

  @EALC1003 @EAIV1007
  Scenario: Open Help Request Form capability executes
    Given the test eApp is open
    When capability EALC1003 (Open Help Request Form) is invoked
    Then EAIV1007 (Help Request Confirmation) is not empty
