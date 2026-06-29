# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Remove Selected Member to work so I can use Circle.

  @EALC15008 @EAIV15010 @EAIV15001 @EAIV15008 @EAIV15009 @EAIV15015
  Scenario: Remove Selected Member capability executes
    Given the Circle eApp is open
    When capability EALC15008 (Remove Selected Member) is invoked
    Then EAIV15010 (Remove Member Result) is not empty
    Then EAIV15001 (Circle Status) is not empty
    Then EAIV15008 (Selected Member DID) is not empty
    Then EAIV15009 (Selected Member Label) is not empty
    Then EAIV15015 (Selection State) is not empty
