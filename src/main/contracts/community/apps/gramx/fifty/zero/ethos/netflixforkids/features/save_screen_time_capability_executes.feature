# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: netflixforkids
  # As a user, I want Save Screen Time to work so I can use netflixforkids.

  @EALC1005 @EAIV1009
  Scenario: Save Screen Time capability executes
    Given the netflixforkids eApp is open
    When capability EALC1005 (Save Screen Time) is invoked
    Then EAIV1009 (Confirmation Message) is not empty
