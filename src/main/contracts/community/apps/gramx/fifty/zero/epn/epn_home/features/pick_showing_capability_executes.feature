# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Home
  # As a user, I want Pick Showing to work so I can use Home.

  @EALC5300 @EAIV5301
  Scenario: Pick Showing capability executes
    Given the Home eApp is open
    When capability EALC5300 (Pick Showing) is invoked
    Then EAIV5301 (Showing) is not empty
