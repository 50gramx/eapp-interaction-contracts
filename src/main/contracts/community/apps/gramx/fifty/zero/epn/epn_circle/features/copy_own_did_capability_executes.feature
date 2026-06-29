# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Copy Own DID to work so I can use Circle.

  @EALC15013 @EAIV15017
  Scenario: Copy Own DID capability executes
    Given the Circle eApp is open
    When capability EALC15013 (Copy Own DID) is invoked
    Then EAIV15017 (Copy Result) is not empty
