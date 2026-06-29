# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Turn Off Circle to work so I can use Circle.

  @EALC15009 @EAIV15014 @EAIV15002 @EAIV15008 @EAIV15009 @EAIV15015
  Scenario: Turn Off Circle capability executes
    Given the Circle eApp is open
    When capability EALC15009 (Turn Off Circle) is invoked
    Then EAIV15014 (Circle Action Result) is not empty
    Then EAIV15002 (Circle Wizard State) is not empty
    Then EAIV15008 (Selected Member DID) is not empty
    Then EAIV15009 (Selected Member Label) is not empty
    Then EAIV15015 (Selection State) is not empty
