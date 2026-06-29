# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: skyscannerforcyberpunk
  # As a user, I want Bookmark Experience to work so I can use skyscannerforcyberpunk.

  @EALC1006 @EAIV1010
  Scenario: Bookmark Experience capability executes
    Given the skyscannerforcyberpunk eApp is open
    When capability EALC1006 (Bookmark Experience) is invoked
    Then EAIV1010 (Filtered Experiences) has at least 1 item
