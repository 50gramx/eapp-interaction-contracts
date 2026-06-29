# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Select Member to work so I can use Circle.

  @EALC15007 @EAIV15008 @EAIV15009 @EAIV15015
  Scenario: Select Member capability executes
    Given the Circle eApp is open
    When capability EALC15007 (Select Member) is invoked
    Then EAIV15008 (Selected Member DID) is not empty
    Then EAIV15009 (Selected Member Label) is not empty
    Then EAIV15015 (Selection State) is not empty
