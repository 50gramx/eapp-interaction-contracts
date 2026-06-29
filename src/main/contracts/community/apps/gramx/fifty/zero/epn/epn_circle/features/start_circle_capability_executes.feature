# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Start Circle to work so I can use Circle.

  @EALC15002 @EAIV15014 @EAIV15001 @EAIV15002
  Scenario: Start Circle capability executes
    Given the Circle eApp is open
    When capability EALC15002 (Start Circle) is invoked
    Then EAIV15014 (Circle Action Result) is not empty
    Then EAIV15001 (Circle Status) is not empty
    Then EAIV15002 (Circle Wizard State) is not empty
