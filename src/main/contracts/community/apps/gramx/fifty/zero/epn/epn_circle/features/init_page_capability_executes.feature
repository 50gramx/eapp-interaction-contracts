# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Init Page to work so I can use Circle.

  @EALC15001 @EAIV15001 @EAIV15018
  Scenario: Init Page capability executes
    Given the Circle eApp is open
    When capability EALC15001 (Init Page) is invoked
    Then EAIV15001 (Circle Status) is not empty
    Then EAIV15018 (Latest Notice) is not empty
