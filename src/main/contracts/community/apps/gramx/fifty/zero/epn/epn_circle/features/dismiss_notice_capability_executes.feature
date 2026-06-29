# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Dismiss Notice to work so I can use Circle.

  @EALC15015 @EAIV15023 @EAIV15019
  Scenario: Dismiss Notice capability executes
    Given the Circle eApp is open
    When capability EALC15015 (Dismiss Notice) is invoked
    Then EAIV15023 (Dismiss Notice Result) is not empty
    Then EAIV15019 (Notice Banner State) is not empty
