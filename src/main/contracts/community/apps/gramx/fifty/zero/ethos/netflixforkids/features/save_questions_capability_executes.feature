# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: netflixforkids
  # As a user, I want Save Questions to work so I can use netflixforkids.

  @EALC1006 @EAIV1006
  Scenario: Save Questions capability executes
    Given the netflixforkids eApp is open
    When capability EALC1006 (Save Questions) is invoked
    Then EAIV1006 (Watchlist) has at least 1 item
