# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Metering
  # As a user, I want Open Turn to work so I can use Metering.

  @EALC11004 @EAIV11025
  Scenario: Open Turn capability executes
    Given the Metering eApp is open
    When capability EALC11004 (Open Turn) is invoked
    Then EAIV11025 (Opened Turn) is not empty
