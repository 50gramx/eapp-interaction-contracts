# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: History
  # As a user, I want Search History to work so I can use History.

  @EALC4002 @EAIV4003
  Scenario: Search History capability executes
    Given the History eApp is open
    When capability EALC4002 (Search History) is invoked
    Then EAIV4003 (Search Results) has at least 1 item
