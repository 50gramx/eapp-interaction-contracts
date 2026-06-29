# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: test
  # As a user, I want Submit Help Request to work so I can use test.

  @EALC1004 @EAIV1007
  Scenario: Submit Help Request capability executes
    Given the test eApp is open
    When capability EALC1004 (Submit Help Request) is invoked
    Then EAIV1007 (Help Request Confirmation) is not empty
