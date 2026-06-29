# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: netflixforkids
  # As a user, I want Add Show to Watchlist to work so I can use netflixforkids.

  @EALC1003 @EAIV1006
  Scenario: Add Show to Watchlist capability executes
    Given the netflixforkids eApp is open
    When capability EALC1003 (Add Show to Watchlist) is invoked
    Then EAIV1006 (Watchlist) has at least 1 item
