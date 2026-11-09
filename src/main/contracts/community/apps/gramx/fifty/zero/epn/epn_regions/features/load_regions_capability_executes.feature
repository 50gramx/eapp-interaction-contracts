# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Regions
  # As a user, I want Load Regions to work so I can use Regions.

  @EALC16001 @EAIV16002
  Scenario: Load Regions capability executes
    Given the Regions eApp is open
    When capability EALC16001 (Load Regions) is invoked
    Then EAIV16002 (Regions) is not empty
