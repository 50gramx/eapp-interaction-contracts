# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: youtubemkbhd
  # As a user, I want Send Collaboration Request to work so I can use youtubemkbhd.

  @EALC1007 @EAIV1016
  Scenario: Send Collaboration Request capability executes
    Given the youtubemkbhd eApp is open
    When capability EALC1007 (Send Collaboration Request) is invoked
    Then EAIV1016 (Notification) is not empty
