# auto-derived — do not edit by hand. Re-generated on every contract change.
Feature: Circle
  # As a user, I want Begin Add Member From Active to work so I can use Circle.

  @EALC15012 @EAIV15003 @EAIV15002 @EAIV15005
  Scenario: Begin Add Member From Active capability executes
    Given the Circle eApp is open
    When capability EALC15012 (Begin Add Member From Active) is invoked
    Then EAIV15003 (Circle Return State) is not empty
    Then EAIV15002 (Circle Wizard State) is not empty
    Then EAIV15005 (Add DID Error) is not empty
